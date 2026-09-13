#!/usr/bin/env bash
# Auto-commit + push dirty work after agent stop (or when invoked manually).
# Reads Cursor hook JSON on stdin; always exits 0 and prints {}.

set -u
cat >/dev/null || true

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "${ROOT}" ]]; then
  printf '%s\n' '{}'
  exit 0
fi
cd "${ROOT}" || exit 0

export PATH="/usr/bin:/bin:/mingw64/bin:/c/Program Files/Git/cmd:/c/Program Files/Git/bin:${PATH:-}"

LOCK_DIR="${ROOT}/.cursor/hooks/state"
LOCK_FILE="${LOCK_DIR}/auto-push.lock"
LAST_FILE="${LOCK_DIR}/last-push.txt"
mkdir -p "${LOCK_DIR}"

# Skip if another auto-push is running
if [[ -f "${LOCK_FILE}" ]]; then
  lock_age=$(( $(date +%s) - $(stat -c %Y "${LOCK_FILE}" 2>/dev/null || echo 0) ))
  if [[ "${lock_age}" -lt 120 ]]; then
    printf '%s\n' '{}'
    exit 0
  fi
  rm -f "${LOCK_FILE}"
fi

touch "${LOCK_FILE}"
cleanup() { rm -f "${LOCK_FILE}"; }
trap cleanup EXIT

# Debounce: at most one push every 20s
now=$(date +%s)
if [[ -f "${LAST_FILE}" ]]; then
  last=$(cat "${LAST_FILE}" 2>/dev/null || echo 0)
  if [[ $((now - last)) -lt 20 ]]; then
    printf '%s\n' '{}'
    exit 0
  fi
fi

# Nothing to do?
if git diff --quiet && git diff --cached --quiet && [[ -z "$(git ls-files --others --exclude-standard)" ]]; then
  printf '%s\n' '{}'
  exit 0
fi

git add -A

# Never commit secrets / junk if they slipped past gitignore
git reset HEAD -- \
  'GoogleService-Info.plist' \
  '**/GoogleService-Info.plist' \
  '.env' \
  '.env.*' \
  '*.p8' \
  '*.p12' \
  'AuthKey_*.p8' \
  '**/__pycache__/**' \
  2>/dev/null || true

if git diff --cached --quiet; then
  printf '%s\n' '{}'
  exit 0
fi

MSG="chore: auto-sync $(date -u +%Y-%m-%dT%H:%MZ)"
# Prefer a slightly more useful summary from changed paths
summary=$(git diff --cached --name-only | head -n 3 | tr '\n' ' ' | sed 's/[[:space:]]*$//')
if [[ -n "${summary}" ]]; then
  MSG="chore: auto-sync - ${summary}"
fi

git -c user.name="Rieterisa" -c user.email="160856540+Rieterisa@users.noreply.github.com" \
  commit -m "${MSG}" --quiet 2>/dev/null || true

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)
if git remote get-url origin >/dev/null 2>&1; then
  git push -u origin "${branch}" --quiet 2>/dev/null || git push --quiet 2>/dev/null || true
fi

echo "${now}" >"${LAST_FILE}"
printf '%s\n' '{}'
exit 0
