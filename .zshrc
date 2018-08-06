autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="
%F{cyan}[%~]%f %1(v|%F{green}%1v%f|)
%(?.%F{yellow}%}.%F{magenta})%n@%f $ "

fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=/usr/local/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }
