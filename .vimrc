" Author: j4ck50n
" OS:     Debian 10 Buster

set nocompatible
filetype off
set encoding=utf-8
set number
set title

let vundleStatus=1
let vundleReadme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundleReadme)
	echo "Vundle installation started..."
	echo ""
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let vundleStatus=0
endif

" Set Vundle runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

function! OpenCompletion()
	if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
		call feedkeys("\<C-x>\<C-o>", "n")
	endif
endfunction

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest,menuone,noselect,noinsert

autocmd InsertCharPre * call OpenCompletion()

" auto
autocmd VimEnter * NERDTree | wincmd p
map <C-n> :NERDTreeToggle<CR>

syntax on
set termguicolors
colorscheme onedark
let base16colorspace=256
" colorscheme base16-default-dark


