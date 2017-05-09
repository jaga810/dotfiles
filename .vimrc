" dein.vim settings
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"if no dein.vim
if &runtimepath !~# '/.dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')
endif

"dein.vim plugins
if dein#load_state(s:dein_dir)
    "begin
    call dein#begin(s:dein_dir)

    "TOML
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir .  '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    "Load TOML and cache
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    "end
    call dein#end()
    call dein#save_state()
endif

"install plugins not installled
if dein#check_install()
    call dein#install()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""enable idnent on"""" 
filetype plugin indent on

"""""colorScheme"""""
if !dein#check_install('molokai')
    colorscheme molokai
    let g:molokai_original = 1
endif
syntax enable

"""""encoding""""
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf8 "保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 "読み込み時の文字コードの自動判別.左側が優先される
set fileformats=unix,dos,mac "改行コードの自動判別.左側が優先
set ambiwidth=double "■や◯文字が崩れる問題を解決

"""""tab&indent""""
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set autoindent "開業時に前の行のインデントを継続
set softtabstop=4 "連続した空白に対してタブキーやバックスペースでカーソルが動く幅
set smartindent "開業時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 "smartindentで増減する幅

"""""status lines"""""
set laststatus=2 "ステータスラインを常に表示
set showmode "現在のモードを表示
set showcmd "打ったコマンドをステータスラインの下に表示
set ruler "ステータスラインの右側にカーソルの現在位置を表示する

"""""cursor"""""
set number
set cursorline

""""clip board""""
set clipboard=unnamed

""""etc mapping""""
inoremap <c-j> <esc>

