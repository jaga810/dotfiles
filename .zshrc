#completion
autoload -Uz compinit
compinit

#set editor
export EDITOR=vim

#set locale
export LC_ALL=C

#プロンプトの表示のカスタマイズ
autoload -Uz colors
colors
autoload -Uz vcs_info
setopt prompt_subst #プロンプトを表示する際に最初に変数展開を行う
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で%c, %u が使用可能に
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commitされていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #addされていないファイルが有る
zstyle ':vcs_info:*' formats '%F{cyan}%c%u(%b)%f' #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase途中, merge　コンフリクト等formats外の表示
precmd() { vcs_info}

PROMPT="${fg[cyan]}[%n@%m]${reset_color} %# "
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
RPROMPT=$RPROMPT' ${vcs_info_msg_0_}'
SPROMPT="%r is correct? [n,y,a,e]: "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="${fg[yellow]}[%n@%m]${reset_color} %# "
#ctrl+sで出力がロックされるのを防ぐ
stty stop undef

#alias
alias ls='ls -CF'
alias la='ls -CFal'
alias rm='rm -i'
alias v='vim'
alias diff='coloddiff'

alias -g ...='../..'
alias -g ....='../../..'

alias gad='git add'
alias gco='git commit -m'
alias g='git'

alias -g G='| grep '

alias -s py='python'
alias -s rb='ruby'

if which pbcopy > /dev/null 2>&1 ; then
    #Mac
    alias -g C=' | pbcopy'
elif which xsel > /dev/null 2>&1 ; then
    #linux
    alias -g C='|xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    #Cygwin
    alias -g C='| putclip'
fi


#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

#options
setopt correct #ミスタイプ時に修正

#zplug
source ~/.zplug/init.zsh

zplug "wbinglee/zsh-wakatime"

#syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

#tools
zplug "marzocchi/zsh-notify"
zplug "oknowtown/zsh-dwim"
