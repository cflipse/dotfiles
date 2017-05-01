let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256


call plug#begin('~/.vim/plugged')
Plug 'kana/vim-textobj-user'

Plug 'tpope/vim-projectionist'

"Plug 'tpope/vim-dispatch'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-git'
Plug 'othree/html5.vim'

Plug 'ag.vim'
Plug 'ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
"Plug 'majutsushi/tagbar'

Plug 'altercation/vim-colors-solarized'
Plug 'Colour-Sampler-Pack'
Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'jeetsukumaran/vim-buffergator'

" GIT
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-cucumber', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby'  }

Plug 'edkolev/tmuxline.vim'

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-fireplace', { 'for': 'elixir' }
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }

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
nmap <leader>p :CtrlP<cr>

" highlight last inserted text
nnoremap gV `[v`]

let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'



hi! Normal cterm=NONE term=NONE ctermfg=12 ctermbg=NONE

let g:solarized_termtrans = 1
let g:ruby_indent_access_modifier_style = 'outdent'


"let test#strategy = 'dispatch'
let test#strategy = 'vimux'

let g:airline_powerline_fonts = 1  " use  the powerline fonts
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 1


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
autocmd FileType qf setlocal norelativenumber colorcolumn&

set mouse=nv
