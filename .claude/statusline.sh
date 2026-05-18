#!/bin/bash

# ── Leer JSON de stdin ───────────────────────────────────────────
INPUT=$(cat)

# ── Tiempo ──────────────────────────────────────────────────────
TIME=$(date '+%H:%M')

# ── Carpeta actual ──────────────────────────────────────────────
CWD=$(echo "$INPUT" | jq -r '.workspace.current_dir // .cwd // empty' 2>/dev/null)
if [ -z "$CWD" ]; then
  CWD=$(pwd)
fi
# Reemplazar $HOME por ~
CWD="${CWD/#$HOME/~}"
FOLDER="📁 $CWD"

# ── Git ─────────────────────────────────────────────────────────
GIT=""
BRANCH=$(git -C "${CWD/#\~/$HOME}" branch --show-current 2>/dev/null)
if [ -z "$BRANCH" ]; then
  BRANCH=$(git branch --show-current 2>/dev/null)
fi
if [ -n "$BRANCH" ]; then
  DIRTY=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  AHEAD=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l | tr -d ' ')
  BEHIND=$(git rev-list HEAD..@{u} 2>/dev/null | wc -l | tr -d ' ')
  GIT="🌿 $BRANCH"
  [ "$DIRTY" -gt 0 ] && GIT="$GIT ✏️$DIRTY"
  [ "$AHEAD" -gt 0 ] && GIT="$GIT ⬆️$AHEAD"
  [ "$BEHIND" -gt 0 ] && GIT="$GIT ⬇️$BEHIND"
fi

# ── Modelo ──────────────────────────────────────────────────────
MODEL=$(echo "$INPUT" | jq -r '.model.display_name // empty' 2>/dev/null)
MODEL_INFO=""
[ -n "$MODEL" ] && MODEL_INFO="✨ $MODEL"

# ── Contexto con barra de progreso ──────────────────────────────
CTX_INFO=""
USED_PCT=$(echo "$INPUT" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
if [ -n "$USED_PCT" ] && [ "$USED_PCT" != "null" ]; then
  USED_INT=$(printf '%.0f' "$USED_PCT")
  BAR_TOTAL=10
  FILLED=$(( USED_INT * BAR_TOTAL / 100 ))
  EMPTY=$(( BAR_TOTAL - FILLED ))
  BAR=""
  for i in $(seq 1 $FILLED); do BAR="${BAR}█"; done
  for i in $(seq 1 $EMPTY);  do BAR="${BAR}░"; done
  CTX_INFO="ctx [${BAR}] ${USED_INT}%"
fi

# ── Kubernetes ──────────────────────────────────────────────────
K8S=""
if command -v kubectl &>/dev/null; then
  CTX=$(kubectl config current-context 2>/dev/null)
  NS=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
  NS=${NS:-default}
  if [ -n "$CTX" ]; then
    K8S="☸️  $CTX/$NS"
  fi
fi

# ── AWS ─────────────────────────────────────────────────────────
AWS_INFO=""
PROFILE=${AWS_PROFILE:-${AWS_DEFAULT_PROFILE:-default}}
REGION=${AWS_DEFAULT_REGION:-${AWS_REGION:-""}}
if [ -z "$REGION" ]; then
  REGION=$(aws configure get region --profile "$PROFILE" 2>/dev/null)
fi
if [ -n "$REGION" ]; then
  AWS_INFO="☁️  $PROFILE/$REGION"
else
  AWS_INFO="☁️  $PROFILE"
fi

# ── Sistema ─────────────────────────────────────────────────────
RAM=$(free -h | awk '/^Mem/ {printf "%s/%s", $3, $2}')
CPU=$(top -bn1 2>/dev/null | grep "Cpu(s)" | awk '{printf "%.0f%%", $2+$4}')
SYS="🧠 $RAM  🔥 $CPU"

# ── Componer ────────────────────────────────────────────────────
PARTS=("🕐 $TIME")
PARTS+=("$FOLDER")
[ -n "$GIT" ]       && PARTS+=("$GIT")
[ -n "$MODEL_INFO" ] && PARTS+=("$MODEL_INFO")
[ -n "$CTX_INFO" ]  && PARTS+=("$CTX_INFO")
[ -n "$K8S" ]       && PARTS+=("$K8S")
[ -n "$AWS_INFO" ]  && PARTS+=("$AWS_INFO")
[ -n "$SYS" ]       && PARTS+=("$SYS")

printf '%s' "$(IFS='  ·  '; echo "${PARTS[*]}")"
