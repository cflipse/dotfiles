let mapleader=','

runtime! debian.vim
set nocompatible

syntax on

set background=dark 
set lcs=eol:$,tab:>·,trail:·

set foldmethod=syntax
set foldlevel=2
set guioptions-=T

"color solarized
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey  guibg=darkgrey



set et
set sw=2
set ts=2

set ai

if has("autocmd")
  filetype indent plugin on
end

runtime macros/matchit.vim

call pathogen#infect()
