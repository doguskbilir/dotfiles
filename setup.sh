#!/bin/bash

set -e

DOTFILES_DIR="${HOME}/dotfiles"
BACKUP_DIR="${HOME}/config.bak"

mkdir -p "${BACKUP_DIR}"

find "${DOTFILES_DIR}" -name ".*" -type f | while IFS= read -r file
do
    filename=$(basename "${file}")
    target="${HOME}/${filename}"

    if [[ -f "${target}" ]]; then
        cp "${target}" "${BACKUP_DIR}/${filename}"
    fi

    ln -sf "${file}" "${target}"
done

echo "Setup complete!"