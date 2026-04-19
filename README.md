## 🌐 Languages

- English (default)
- [Portuguese (Brazil)](README.pt-BR.md)

# wl-bright — Brightness Control via Gammastep (Wayland)

Lightweight CLI tool for adjusting screen brightness in Wayland environments using **gammastep**, with state persistence and safety limits.

---

## 📌 Overview

Designed for **minimal Wayland environments (e.g. Sway)** where there is no simple native terminal-based brightness control.

**Goal:** predictable brightness control via CLI and keyboard shortcuts, without relying on full desktop environments.

---

## 🔆 Features

- Incremental control (`up` / `down`)
- Direct value setting (`set`)
- Current value query (`get`)
- Local state persistence
- Safety limits (clamping)
- Direct integration with Sway keybindings

---

## 🛠 Requirements

- `bash`
- `bc`
- `gammastep`
- Wayland session

---

## ⚙️ Installation

```bash
git clone https://github.com/nikorvich/wl-bright.git
cd wl-bright
bash install.sh
````

Installs the `wl-bright` command to:

```bash
~/.local/bin
```

---

## ▶️ Usage

```bash
wl-bright up
wl-bright down
wl-bright set 0.80
wl-bright get
wl-bright --help
wl-bright --version
```

---

## ⌨️ Sway Integration

```bash
bindsym $mod+F1 exec wl-bright down
bindsym $mod+F2 exec wl-bright up
```

---

## ⚠️ Behavior Notes

- Brightness value is always saved locally, even if `gammastep` is unavailable
    
- If `gammastep` is missing:
    
    - value is persisted
        
    - application is skipped with warning
        

---

## 🔬 Technical Limitation

`gammastep`:

- does not control physical backlight
    
- applies gamma correction (visual effect only)
    
- may introduce artifacts at low brightness levels
    

---

## 🧠 Technical Context

Wayland (especially with Sway) does not provide a consistent interface for hardware brightness control across devices.

Attempts using:

- `/sys/class/backlight`
    
- DDC/CI
    

were rejected due to:

- hardware inconsistency
    
- lack of reliability
    
- unnecessary complexity for this use case
    

**Decision:**

> use `gammastep` as a practical and predictable solution

---

## 📊 Configuration

|Parameter|Value|Description|
|---|---|---|
|DEFAULT|0.70|Initial brightness|
|STEP|0.05|Increment step|
|MIN|0.10|Minimum limit|
|MAX|1.00|Maximum limit|

---

## 📎 Author

nikorvich  
[https://github.com/nikorvich](https://github.com/nikorvich)
