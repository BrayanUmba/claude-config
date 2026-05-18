# Claude Code Config

Configuraciones personales de Claude Code para Brayan Umba — DevSecOps Engineer.

## Contenido

| Archivo | Descripción |
|---|---|
| `.claude/settings.json` | Configuración principal: tema, permisos, status line, hooks, anuncios |
| `.claude/statusline.sh` | Script de barra de estado: hora, carpeta, git, modelo, contexto, k8s, aws, RAM/CPU |
| `.claude/devsecops-news.sh` | Script de noticias DevSecOps al iniciar sesión |
| `.claude/CLAUDE.md` | Instrucciones globales para Claude (idioma, git workflow, calidad) |

## Instalación en un PC nuevo

```bash
# 1. Clonar el repo
git clone git@github.com:BrayanUmba/claude-config.git

# 2. Copiar configuraciones
cp -r claude-config/.claude/* ~/.claude/

# 3. Dar permisos a los scripts
chmod +x ~/.claude/statusline.sh ~/.claude/devsecops-news.sh
```

## Características

- **Tema**: dark-ansi (alto contraste, estilo terminal)
- **Status line**: 🕐 hora · 📁 carpeta · 🌿 git branch · ✨ modelo · ctx [████░░] % · ☸️ k8s · ☁️ aws · 🧠 RAM 🔥 CPU
- **SessionStart**: Noticia DevSecOps del día con link al artículo
- **Anuncios**: Frases rotativas de cultura DevSecOps
- **Commits**: Sin atribución de Claude Code
