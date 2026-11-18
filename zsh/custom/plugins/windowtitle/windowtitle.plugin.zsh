# set user@host:cwd in terminal title
autoload -Uz add-zsh-hook
_set_window_title() {
    case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
            printf "\033]0;%s@%s:%s\007" "${USER}" "${HOST%%.*}" "${PWD/#$HOME/~}"
            ;;
        screen*|tmux*)
            printf "\033_%s@%s:%s\033\\" "${USER}" "${HOST%%.*}" "${PWD/#$HOME/~}"
            ;;
    esac
}
add-zsh-hook precmd _set_window_title
