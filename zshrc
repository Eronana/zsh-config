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

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

unset zle_bracketed_paste

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
alias reload="source ~/.zshrc"
alias update-zsh-config='pushd $ZSH_CONFIG_PATH && git fetch && [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ] && git merge && reload && popd -q'

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
