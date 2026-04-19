# wl-bright — Controle de Brilho via Gammastep (Wayland)

Ferramenta CLI leve para ajuste de brilho em ambientes Wayland utilizando **gammastep**, com persistência de estado e limites de segurança.

---

## 📌 Visão Geral

Desenvolvido para **ambientes Wayland minimalistas (ex: Sway)** onde não há controle nativo simples de brilho via terminal.

**Objetivo:** fornecer controle de brilho previsível via CLI e atalhos de teclado, sem depender de ambientes gráficos completos.

---

## 🔆 Funcionalidades

- Ajuste incremental (`up` / `down`)
- Definição direta de valor (`set`)
- Consulta do valor atual (`get`)
- Persistência local de estado
- Limites de segurança (clamping)
- Integração direta com atalhos do Sway

---

## 🛠 Requisitos

- `bash`
- `bc`
- `gammastep`
- sessão Wayland

---

## ⚙️ Instalação

```bash
git clone https://github.com/nikorvich/wl-bright.git
cd wl-bright
bash install.sh
````

Instala o comando `wl-bright` em:

```bash
~/.local/bin
```

---

## ▶️ Uso

```bash
wl-bright up
wl-bright down
wl-bright set 0.80
wl-bright get
wl-bright --help
wl-bright --version
```

---

## ⌨️ Integração com Sway

```bash
bindsym $mod+F1 exec wl-bright down
bindsym $mod+F2 exec wl-bright up
```

---

## ⚠️ Comportamento

- O valor de brilho **sempre é salvo localmente**, mesmo sem `gammastep`
    
- Se `gammastep` não estiver disponível:
    
    - o valor é persistido
        
    - a aplicação é ignorada com aviso
        

---

## 🔬 Limitação Técnica

O `gammastep`:

- não controla o brilho físico do display
    
- aplica apenas correção de gamma (efeito visual)
    
- pode gerar artefatos em níveis baixos de brilho
    

---

## 🧠 Contexto Técnico

Wayland (especialmente com Sway) não fornece uma interface consistente para controle de brilho físico entre diferentes dispositivos.

Tentativas com:

- `/sys/class/backlight`
    
- DDC/CI
    

foram descartadas devido a:

- inconsistência entre hardwares
    
- baixa confiabilidade
    
- complexidade desnecessária para o problema
    

**Decisão:**

> usar `gammastep` como solução prática e previsível

---

## 📊 Configuração

|Parâmetro|Valor|Descrição|
|---|---|---|
|DEFAULT|0.70|Brilho inicial|
|STEP|0.05|Incremento|
|MIN|0.10|Limite mínimo|
|MAX|1.00|Limite máximo|

---

## 📎 Autor

nikorvich  
[https://github.com/nikorvich](https://github.com/nikorvich)
