let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

if has("autocmd")
  filetype indent plugin on
end

call pathogen#infect()


syntax on

set background=dark 
set lcs=tab:>·,trail:· list

set foldmethod=syntax
set foldlevel=5
set nofoldenable
set guioptions-=T

set et sw=2 ts=2 ai
set ruler
set laststatus=2

set autoread

set ic sc
