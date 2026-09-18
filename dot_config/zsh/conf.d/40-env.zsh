export XMODIFIERS='@im=fcitx'
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

export XDG_DATA_DIRS="${HOME}/.local/share/flatpak/exports/share:${XDG_DATA_DIRS}"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:${XDG_DATA_DIRS}"

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
