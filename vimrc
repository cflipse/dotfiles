let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256
let g:solarized_termcolors=256


if has("autocmd")
  filetype indent plugin on
end

syntax on
call pathogen#infect()



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

map <leader>t :!rspec -fn %<cr>
map <leader>T :!rspec -fn<cr>
map <leader>w :!cucumber -pwip<cr>
map <leader>c :!cucumber<cr>

set winheight=10
set winminheight=5
set winheight=1000

