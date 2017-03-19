set encoding=utf-8
scriptencoding utf-8

""""""""""""""""""""""""""""""
" setup of plugins
""""""""""""""""""""""""""""""
if has('vim_starting')
    "初回起動時のみruntimepathにneoBundleのパスを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    "NeoBundleが未インストールであればgit cloneする....
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------

"color scheme 'moLokai'
NeoBundle 'tomasr/molokai'
"improve status lines
NeoBundle 'itchyny/lightline.vim'
"highlight extra  space :fixWhitespaceで消去
NeoBundle 'bronson/vim-trailing-whitespace'
"visualize indents
NeoBundle 'Yggdroot/indentLine'
"auto pate mode"
NeoBundle 'ConradIrwin/vim-bracketed-paste'
"code complement, snipet, snippet library
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle "Shougo/neosnippet"
    NeoBundle 'Shougo/neosnippet-snippets'
endif
"多機能セレクタ
NeoBundle 'ctrlpvim/ctrlp.vim'
"CtrlPの拡張プラグイン　関数検索
NeoBundle 'tacahiroy/ctrlp-funky'
"CtrlPの拡張プラグイン　コマンド履歴検索
NeoBundle 'suy/vim-ctrlp-commandline'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
"markdown preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
"show the nerdtree"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neomru.vim'
"add end for ruby"
NeoBundle 'tpope/vim-endwise'
"コメントアウトを行う"
NeoBundle 'tpope/vim-commentary'
"coffee scriptのシンタックスハイライト
NeoBundle 'kchmck/vim-coffee-script'
"----------------------------------------------------------
call neobundle#end()

"ファイルタイプ別のvimプラグイン/インデントを有効にする
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
"shortcut settings
""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""
"Settings
"""""""""""""""""""""""""""""
"""""colorScheme"""""
if neobundle#is_installed('molokai')
colorscheme molokai
endif
set t_Co=256 "iTerm2など既に256食環境なら必要なし
syntax enable

"""""encoding""""
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

"""""search Strings"""""
set incsearch "インクリメンタルサーチ,位置文字入力毎に検索を行う
set ignorecase "検索パターンに大文字小文字を区別しない
set smartcase "検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch "検索結果をハイライトする
"ESC２度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"""""cursor"""""
set whichwrap=b,s,h,l,<,>,[,],~ "カーソルの左右移動で行末から次の行の行頭へ移動が可能に
set number "行番号を表示
set cursorline "カーソルLINEをハイライト
"行が繰り返し表示されていた場合、行単位でなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
"バックスペースキーの有効可
set backspace=indent,eol,start

"""""jump"""""
set showmatch "括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim "Vimの%を拡張する

"""""complement""""
set wildmenu "コマンドモードの補完
set history=5000 "保存するコマンド履歴の数

""""mouse""""
"マウスでカーソル移動やスクロール移動を可能にする
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"""""paste settings"""""
"ペースト時の自動インデントによるずれの修正
if &term =~"xterm"
    let &t_SI .= "\e[?20004h"
    let &t_EI .= "\e[?20004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <spceial> <expr> <Esc>[200~ XtermPasteBegin("")
endif

"""""status lines"""""""
set laststatus=2 "ステータスラインを常に表示
set showmode "現在のモードを表示
set showcmd "打ったコマンドをステータスラインの下に表示
set ruler "ステータスラインの右側にカーソルの現在位置を表示する

"""""NeoComplete NeoSnippet""""""
if neobundle#is_installed('neocomplete.vim')
    "vim起動時にneocompleteを有効化
    let g:neocomplete#enable_at_startup = 1
    "smartcase 有効化 大文字が入力されるまで大文字小文字の区別を無視
    let g:neocomplete#enable_smart_case = 1
    "3文字以上の単語に対して補完を有効に
    let g:neocomplete#enable_auto_delimiter = 1
    "1文字目の入力から補完のポップアップを表示
    let g:neocomplete#enable_auto_completion_smart_length = 1
    "backspaceで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    "エンターキーで補完候補の確定 水ペットの展開もエンターで確定
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisi()? "<C-y>"
    "タブキーで補完候補の選択 スニペット内のジャンプ
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

"""""CtrLpの設定"""""""
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' "マッチウィンドウの設定　下部表示　大きさ20行で固定　検索結果100件
let g:ctrlp_show_hidden = 1  "ドットファイルを検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] "CtrLPの拡張としてfunckyとcommandlineを使う
"CtrLpCOmmandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())
"CtrLPFunkyの有効化
let g:ctrlp_funky_cmatchtype = 'path'

""""""markdown preview """"""""
au BufRead,BufNewFile *.md set filetype=markdown

"""""clip board""""""
set clipboard=unnamed

"""""netrw"""""
set nocompatible
filetype plugin on

""""""mapping""""""""
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap Y y$

inoremap <c-j> <esc>
nnoremap <F3> :noh<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
