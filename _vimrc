""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
"show the nerdtree"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neomru.vim'
"add end for ruby"
NeoBundle 'tpope/vim-endwise'
" ...省略

call neobundle#end()

" Required:
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
syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set number
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
