set t_Co=256
set nocompatible
filetype off    " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
set mouse=a
set number
syntax on
colorscheme Mustang
set background=dark
" set showmode
