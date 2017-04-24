let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256


call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'kana/vim-textobj-user'

Plug 'tpope/vim-projectionist'

Plug 'tpope/vim-dispatch'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-git'
Plug 'othree/html5.vim'

Plug 'ag.vim'
Plug 'ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'gundo'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
"Plug 'majutsushi/tagbar'

Plug 'altercation/vim-colors-solarized.git'
Plug 'Colour-Sampler-Pack'
Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" GIT
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ngmy/vim-rubocop'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-fireplace'
Plug 'avdgaag/vim-phoenix'

if has('nvim')
  Plug 'w0rp/ale'
  Plug 'kassio/neoterm'
endif

call plug#end()


set lcs=tab:>·,trail:· list

set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
set foldenable
set guioptions-=T

set et sw=2 ts=2 ai
set ruler
set laststatus=2

set relativenumber
set number
set colorcolumn=80
set autoread

set ic sc
set noshowmatch

set lazyredraw

" search recursively
set path+=**
set wildmenu


let g:netrw_banner=0

map <leader>f :TestNearest<cr>
map <leader>t :TestFile<cr>
map <leader>l :TestLast<cr>
map <leader>T :TestSuite<cr>
map <leader>n :TestSuite --next-failure<cr>
map <leader>w :!bundle exec cucumber -pwip<cr>
map <leader>c :!bundle exec cucumber<cr>

map <leader>g :Ag <cword><cr>

" highlight last inserted text
nnoremap gV `[v`]

let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


hi! Normal cterm=NONE term=NONE ctermfg=12 ctermbg=NONE

let g:solarized_termtrans = 1
let g:ruby_indent_access_modifier_style = 'outdent'

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1  " use  the powerline fonts

"let test#strategy = 'dispatch'
let test#strategy = 'vimux'


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"



" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

syntax on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ex,*.exs set filetype=elixir

autocmd Filetype gitcommit setlocal spell textwidth=72
