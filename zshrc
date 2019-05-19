export ZSH_CONFIG_PATH=${0:a:h}
source $ZSH_CONFIG_PATH/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle brew
antigen bundle pip
antigen bundle node
antigen bundle npm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme eronana/agnoster-zsh-theme agnoster

antigen apply

DEFAULT_USER=$USER

unset zle_bracketed_paste
unsetopt pushd_ignore_dups

alias rssh="ssh -l root"
eval $(thefuck --alias)

alias gfw="proxychains4"
alias fq="proxychains4 -q"

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey "^X\\x7f" backward-kill-line

alias cnpm="npm --registry=https://registry.npm.taobao.org"

alias unixtime="date +%s"

alias nr="npm run"
alias cni="cnpm i"
alias nrw="npm run watch"
alias reload="antigen reset && source ~/.zshrc"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

alias sui="sudo -i --preserve-env=SSH_CONNECTION"

function zc {
  local fun="zc_$1"
  if ! is_function $fun; then
    echo "command $1 does not exists"
    return 1
  fi
  $fun ${@:2}
}

function zc_update {
  local exitCode=0
  pushd -q $ZSH_CONFIG_PATH
  git fetch
  if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
    git merge
    reload
    exitCode=$?
  fi
  popd -q
  return $exitCode
}

function is_function {
  type $1 | head -1 | egrep "^$1.*function" >/dev/null 2>&1
}


(zc_update >/dev/null 2>&1 &)
