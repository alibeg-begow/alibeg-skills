#!/usr/bin/env bash
set -euo pipefail

# Cross-platform installer for the 'alibeg' AI agent skill (macOS / Linux / Git Bash).
#
# Usage:
#   ./scripts/install.sh --project /path/to/project [--targets all|agents,claude,gemini] [--no-bridges] [--init-decisions] [--dry-run]
#   ./scripts/install.sh --global [--targets all|agents,antigravity,claude,gemini] [--dry-run]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILL_FILE="${SOURCE_ROOT}/SKILL.md"
REFERENCES_DIR="${SOURCE_ROOT}/references"
TEMPLATES_DIR="${SOURCE_ROOT}/templates"

PROJECT_DIR=""
INSTALL_GLOBAL=0
TARGETS="all"
NO_BRIDGES=0
INIT_DECISIONS=0
DRY_RUN=0

usage() {
  cat <<'EOF'
Usage:
  ./scripts/install.sh --project <path> [--targets all|agents,claude,gemini] [--no-bridges] [--init-decisions] [--dry-run]
  ./scripts/install.sh --global [--targets all|agents,antigravity,claude,gemini] [--dry-run]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      PROJECT_DIR="${2:-}"
      shift 2
      ;;
    --global)
      INSTALL_GLOBAL=1
      shift
      ;;
    --targets)
      TARGETS="${2:-all}"
      shift 2
      ;;
    --no-bridges)
      NO_BRIDGES=1
      shift
      ;;
    --init-decisions)
      INIT_DECISIONS=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ ! -f "$SKILL_FILE" || ! -d "$REFERENCES_DIR" ]]; then
  echo "Invalid alibeg source directory: ${SOURCE_ROOT}" >&2
  exit 1
fi

if [[ -z "$PROJECT_DIR" && "$INSTALL_GLOBAL" -eq 0 ]]; then
  usage >&2
  exit 1
fi

has_target() {
  local needle="$1"
  if [[ "$TARGETS" == "all" ]]; then
    return 0
  fi
  IFS=',' read -ra list <<< "$TARGETS"
  for item in "${list[@]}"; do
    if [[ "$item" == "$needle" ]] || [[ "$needle" == "agents" && "$item" == "antigravity" ]]; then
      return 0
    fi
  done
  return 1
}

copy_skill_payload() {
  local dest="$1"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[DRY-RUN] Sync skill payload -> ${dest}"
    return
  fi

  rm -rf "$dest"
  mkdir -p "$dest"
  cp "$SKILL_FILE" "${dest}/SKILL.md"
  cp -R "$REFERENCES_DIR" "${dest}/references"

  if [[ -f "${TEMPLATES_DIR}/DECISIONS.md" ]]; then
    mkdir -p "${dest}/templates"
    cp "${TEMPLATES_DIR}/DECISIONS.md" "${dest}/templates/DECISIONS.md"
  fi

  echo "[OK] Synced skill -> ${dest}"
}

merge_bridge_file() {
  local template_path="$1"
  local target_path="$2"
  local start_marker="<!-- alibeg-skill:start -->"
  local end_marker="<!-- alibeg-skill:end -->"

  if [[ ! -f "$target_path" ]]; then
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "[DRY-RUN] Create bridge -> ${target_path}"
      return
    fi
    cp "$template_path" "$target_path"
    echo "[OK] Created bridge -> ${target_path}"
    return
  fi

  if grep -Fq "$start_marker" "$target_path" && grep -Fq "$end_marker" "$target_path"; then
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "[DRY-RUN] Update bridge -> ${target_path}"
      return
    fi
    local tmp_file
    tmp_file="$(mktemp)"
    awk -v start="$start_marker" -v end="$end_marker" -v tpl="$template_path" '
      BEGIN { in_block = 0; replaced = 0 }
      index($0, start) > 0 && !replaced {
        while ((getline line < tpl) > 0) print line
        close(tpl)
        in_block = 1
        replaced = 1
        next
      }
      in_block {
        if (index($0, end) > 0) in_block = 0
        next
      }
      { print }
    ' "$target_path" > "$tmp_file"
    mv "$tmp_file" "$target_path"
    echo "[OK] Updated bridge -> ${target_path}"
  else
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "[DRY-RUN] Append bridge -> ${target_path}"
      return
    fi
    printf '\n' >> "$target_path"
    cat "$template_path" >> "$target_path"
    echo "[OK] Appended bridge -> ${target_path}"
  fi
}

if [[ -n "$PROJECT_DIR" ]]; then
  if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "Target project path does not exist or is not a directory: ${PROJECT_DIR}" >&2
    exit 1
  fi

  PROJECT_ROOT="$(cd "$PROJECT_DIR" && pwd)"
  if [[ "$PROJECT_ROOT" == "$SOURCE_ROOT" ]]; then
    echo "Target project cannot be the alibeg source repository itself." >&2
    exit 1
  fi

  echo "Installing 'alibeg' skill into project: ${PROJECT_ROOT}"

  if has_target "agents"; then
    copy_skill_payload "${PROJECT_ROOT}/.agents/skills/alibeg"
    if [[ "$NO_BRIDGES" -eq 0 ]]; then
      merge_bridge_file "${TEMPLATES_DIR}/AGENTS.md" "${PROJECT_ROOT}/AGENTS.md"
    fi
  fi

  if has_target "claude"; then
    copy_skill_payload "${PROJECT_ROOT}/.claude/skills/alibeg"
    if [[ "$NO_BRIDGES" -eq 0 ]]; then
      merge_bridge_file "${TEMPLATES_DIR}/CLAUDE.md" "${PROJECT_ROOT}/CLAUDE.md"
    fi
  fi

  if has_target "gemini"; then
    copy_skill_payload "${PROJECT_ROOT}/.gemini/skills/alibeg"
    if [[ "$NO_BRIDGES" -eq 0 ]]; then
      merge_bridge_file "${TEMPLATES_DIR}/GEMINI.md" "${PROJECT_ROOT}/GEMINI.md"
    fi
  fi

  if [[ "$INIT_DECISIONS" -eq 1 ]]; then
    decisions_dest="${PROJECT_ROOT}/docs/DECISIONS.md"
    if [[ -f "$decisions_dest" ]]; then
      echo "[SKIP] Decision log already exists -> ${decisions_dest}"
    elif [[ "$DRY_RUN" -eq 1 ]]; then
      echo "[DRY-RUN] Create decision log -> ${decisions_dest}"
    else
      mkdir -p "${PROJECT_ROOT}/docs"
      cp "${TEMPLATES_DIR}/DECISIONS.md" "$decisions_dest"
      echo "[OK] Created decision log -> ${decisions_dest}"
    fi
  fi
fi

if [[ "$INSTALL_GLOBAL" -eq 1 ]]; then
  echo "Installing 'alibeg' skill globally under: ${HOME}"

  if has_target "agents"; then
    copy_skill_payload "${HOME}/.agents/skills/alibeg"
  fi
  if has_target "antigravity"; then
    copy_skill_payload "${HOME}/.gemini/config/skills/alibeg"
  fi
  if has_target "claude"; then
    copy_skill_payload "${HOME}/.claude/skills/alibeg"
  fi
  if has_target "gemini"; then
    copy_skill_payload "${HOME}/.gemini/skills/alibeg"
  fi
fi

echo "Done."

