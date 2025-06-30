#!/bin/bash

REPO_DIR="$HOME/Documents/Obsidian Vault"  # Repo Local
REMOTE="origin"                            # Repo Remoto
BRANCH="main"                              # Rama principal
MAX_RETRIES=2                              # Reintentos antes de fallar
LOG_DIR="$HOME/.logs/sync-obsidian"        # Carpeta Logs

# Crear directorio de logs si no existe
mkdir -p "$LOG_DIR" 2>/dev/null

# Log con timestamp
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_DIR/sync-obsidian.log"
}

# Verifica conexion a internet
check_online() {
    curl -Is --connect-timeout 3 https://github.com | head -n1 | grep -q "200\|301"
}

# Sincronizacion
sync_repo() {
    cd "$REPO_DIR" || { log "Error: Directorio no encontrado"; return 1; }

    # Verifica cambios locales
    if git diff-index --quiet HEAD -- 2>/dev/null; then
        log "Sin cambios locales"
        return 0
    fi

    # Pull antes de push para evitar conflictos
    if ! git pull --quiet 2>>"$LOG_DIR/error.log"; then
        log "Error al hacer pull"
        return 1
    fi

    # Commit + Push con reintentos
    git add . 2>>"$LOG_DIR/error.log"
    git commit -m "Updated $(date '+%Y-%m-%d %H:%M:%S')" --quiet 2>>"$LOG_DIR/error.log"

    for ((i=1; i<=MAX_RETRIES; i++)); do
        if git push --quiet 2>>"$LOG_DIR/error.log"; then
            log "Sincronizacion exitosa"
            return 0
        fi
        sleep 5
    done

    log "Error: Fallo despues de $MAX_RETRIES intentos"
    return 1
}

# Ejecucion principal, sin bucle ya que lo maneja Cron
if check_online; then
    sync_repo
else
    log "Sin conexión a internet"
fi