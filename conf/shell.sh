addon_folder="${HOME}/conf/addon"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias ll='ls -la'
alias aupdate='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias bupdate='brew update && brew upgrade'
alias pip='pip3'
alias python='python3'

if [ -d $addon_folder ]; then
    for file in $( ls $addon_folder | grep .sh$ ); do
        source "${addon_folder}/${file}"
    done
fi

function mkcd () {
    mkdir $1 && cd $_
}

export PIPENV_VENV_IN_PROJECT=1
export CUBLAS_WORKSPACE_CONFIG=:16:8