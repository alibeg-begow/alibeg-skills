# `alibeg` — Kişisel Mühendislik, Tasarım & Çalışma Tarzı Skill'i

Antigravity, Claude Code, Gemini CLI, Codex ve Cursor dahil **Agent Skills (`SKILL.md`)** standardını destekleyen tüm AI kodlama ajanlarında aynı tasarım çizgisini, çalışma disiplinini ve mühendislik standartlarını eksiksiz uygulamak için hazırlanmış taşınabilir skill paketi.

---

## Paket Yapısı

```text
alibeg/
├── SKILL.md                              # Ana skill giriş noktası (tüm platformlar burayı okur)
├── references/                           # İhtiyaç anında yüklenen derin referans modülleri
│   ├── workflow-and-communication.md     # Analiz -> Soru -> Plan -> Onay -> Otomatik Mod, iletişim & itiraz kuralları
│   ├── design-philosophy.md              # Zorunlu Project Art Direction Brief, Modern Craft kalite standardı, Light+Dark, motion, Türkçe tipografi
│   ├── anti-ai-slop.md                   # Çok nesilli Anti-AI-Slop negatif prompt (1., 2. ve 3.+ nesil kaçış şablonları) & 12 maddelik denetim listesi
│   ├── design-pipeline.md                # Zorunlu 5 aşamalı tasarım süreci + Mockup öncesi Art Direction Brief kapısı
│   └── engineering-standards.md          # Stack politikası, production-grade DoD, güvenlik, performans, halüsinasyon yasağı, Git/DB sınırları
├── templates/                            # Her oturumda otomatik tetikleme sağlayan hafif köprü şablonları
│   ├── AGENTS.md                         # Universal / Antigravity / Codex / Cursor köprüsü
│   ├── CLAUDE.md                         # Claude Code köprüsü
│   ├── GEMINI.md                         # Gemini CLI / Antigravity köprüsü
│   └── DECISIONS.md                      # Uzun projeler için plan & karar hafızası şablonu
└── scripts/
    ├── install.ps1                       # Windows PowerShell kurulum & güncelleme scripti
    └── install.sh                        # macOS / Linux / Git Bash kurulum & güncelleme scripti
```

> **Not:** Talimat dosyaları (`SKILL.md` ve `references/`) tüm modellerde en keskin kural takibi ve token verimliliği için **İngilizce** yazılmıştır; ancak ajanın seninle kuracağı tüm iletişim **açıkça Türkçe** olacak şekilde zorunlu kılınmıştır.

---

## Kurulum & Kullanım

### 1. Mevcut veya Yeni Bir Projeye Ekleme (Windows PowerShell)

```powershell
# Tüm platformlar (.agents, .claude, .gemini) + AGENTS.md / CLAUDE.md / GEMINI.md köprüleri
.\scripts\install.ps1 -Project "C:\Projeler\ornek-proje"

# Aynı kurulum + proje içi karar hafızası (docs/DECISIONS.md) başlatma
.\scripts\install.ps1 -Project "C:\Projeler\ornek-proje" -InitDecisions

# Önce ne yapacağını görmek için dry-run
.\scripts\install.ps1 -Project "C:\Projeler\ornek-proje" -DryRun

# Sadece belirli araçlar için kurulum
.\scripts\install.ps1 -Project "C:\Projeler\ornek-proje" -Targets claude,gemini
```

> **Windows ExecutionPolicy Notu:** Windows PowerShell'de yerel `.ps1` script çalıştırma kapalıysa (`running scripts is disabled`), bir defaya mahsus `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` çalıştırabilir veya aynı kurulumu Git Bash / WSL üzerinden `bash ./scripts/install.sh` ile doğrudan çalıştırabilirsin.

### 2. Bilgisayara Global Kurulum (İstediğin Zaman)

Global kurulum yaptığında `alibeg` skill'i makinedeki tüm projelerde otomatik keşfedilir:

```powershell
# Önce ne yapacağını kontrol et
.\scripts\install.ps1 -Global -DryRun

# Global kurulumu uygula (~/.agents, ~/.gemini/config, ~/.claude, ~/.gemini)
.\scripts\install.ps1 -Global
```

### 3. macOS / Linux / Git Bash Kullanımı

```bash
chmod +x ./scripts/install.sh

# Projeye kurulum
./scripts/install.sh --project /path/to/my-project --init-decisions

# Global kurulum
./scripts/install.sh --global
```

### Güvenli Güncelleme (Idempotent)

Kurulum scriptleri mevcut `AGENTS.md`, `CLAUDE.md` veya `GEMINI.md` dosyalarını **ezmez**:
- Dosya yoksa yeni oluşturur.
- Dosya varsa sadece `<!-- alibeg-skill:start -->` ile `<!-- alibeg-skill:end -->` arasındaki bloğu günceller veya dosyanın sonuna ekler.
- `alibeg` kurallarını bu klasörde güncellediğinde aynı komutu tekrar çalıştırman tüm hedefleri temiz şekilde senkronize eder.

---

## Skill Neleri Garanti Eder?

1. **Çalışma Akışı:** Detaylı analiz → önerili net sorular → detaylı plan → **onay kapısı** → minimum soruyla **Otomatik Mod** (plan dışı orta/büyük değişiklikte durup onay alma).
2. **İletişim & İtiraz:** Direkt, teknik ve yağcılıksız Türkçe; kararların *"neden"*ini kısa ve öğretici şekilde açıklama; kötü/eksik kararlarda açıkça itiraz edip gerekçesiyle daha iyi yolu savunma.
3. **5 Aşamalı Tasarım Süreci & Art Direction Kapısı:** Yeni ürün/sayfa/büyük redesign işlerinde `_design/` altında tarayıcıda açılabilir aşamalı çıktılar: `Sitemap → Wireframe → [Art Direction Brief] → Mockup → Prototype → Gerçek Kod` (her aşamada onay kapısı; görsel yön verilmediyse Mockup'tan önce projeye özgü 2 farklı Art Direction seçeneği sunulup kilitlenir; küçük bugfix'lerde direkt uygulama).
4. **Tasarım Kalitesi & Çok Nesilli Anti-AI-Slop:** Her projede **Light + Dark tema zorunlu**; **Modern Craft & Minimalist Premium** kalite standardı (tek tip şablon değil); UX bozmadan elit hissettiren animasyon; Türkçe karakter (`ç ğ ı İ ö ş ü`) doğrulaması; **1. nesil** (mor-mavi gradient, glow, iç içe kart, emoji/sparkle), **2. nesil** (**Technical Brutalist Slop / "Template Chrome"** — `01 / SECTION` mono etiketler, keskin `0px` wireframe filtre kutuları) ve **3.+ nesil bağlamsız kaçış şablonları** (krem+serif+terracotta Warm Editorial refleksi, steril Shadcn 4-KPI fotokopisi, güvenli teal-beyaz SaaS klonu, boş Apple-Bento widget'ları, alakasız Neo-Brutalist/Retro-OS kostümleri) için sıfır tolerans.
5. **Mühendislik & Güvenlik:** Sabit stack dayatması yok (mevcut repoya tam uyum, yeni projede onaylı modern öneri); production-grade kod, minimal diff, güvenlik/performans hijyeni, halüsinasyon yasağı, gerçek doğrulama olmadan "bitti" dememe; `git push`, DB veri silme ve prod/deploy işlemlerinde kesin onay kapısı.
