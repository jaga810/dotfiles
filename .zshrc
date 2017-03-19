#completion
autoload -U compinit
compinit

#set locale
export LC_ALL=C

#git settings
# source /usr/local/git/contrib/completion/git-prompt.sh
# source /usr/local/git/contrib/completion/git-completion.bash
# GIT_PS1_SHOWDIRTYSTATE=true

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

PROMPT="${fg[cyan]}[%n@%m]${reset_color} "
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
RPROMPT=$RPROMPT' ${vcs_info_msg_0_}'

#ctrl+sで出力がロックされるのを防ぐ
stty stop undef

#alias
alias ls='ls -CF'
alias la='ls -CFal'
alias rm='rm -i'
alias v='vim'
alias diff='coloddiff'

#環境変数の設定
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.nodebrew/current/bin:$PATH"

#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

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
