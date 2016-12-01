#プロンプトの表示のカスタマイズ
PS1="\[\033[36m\]\W\[\033[0m\] $ "

#ctrl+sで出力がロックされるのを防ぐ
stty stop undef

#alias
alias ls='ls -CF'
alias la='ls -CFal'
alias rm='rm -i'
alias v='vim'

#環境変数の設定
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


