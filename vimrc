let mapleader=','

runtime! debian.vim
set nocompatible

syntax on

set background=dark 
set lcs=eol:$,tab:>·,trail:·

set foldmethod=syntax
set foldlevel=5
set nofoldenable
set guioptions-=T

set et sw=2 ts=2 ai

set ic sc

if has("autocmd")
  filetype indent plugin on
end

runtime macros/matchit.vim

call pathogen#infect()
