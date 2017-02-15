#git settings
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#プロンプトの表示のカスタマイズ
PS1='\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '

#ctrl+sで出力がロックされるのを防ぐ
stty stop undef

#alias
alias ls='ls -CF'
alias la='ls -CFal'
alias rm='rm -i'
alias v='vim'

#環境変数の設定
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.nodebrew/current/bin:$PATH"

