let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256


call plug#begin('~/.vim/plugged')
Plug 'kana/vim-textobj-user'

Plug 'tpope/vim-projectionist'

Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" Plug 'benmills/vimux'
" Plug 'christoomey/vim-tmux-navigator'

Plug 'othree/html5.vim'

Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
"Plug 'majutsushi/tagbar' 

Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

"Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-bundler'

Plug 'w0rp/Ale'

" GIT
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-cucumber', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby'  }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-fireplace', { 'for': 'elixir' }
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }

" JS
Plug 'joukevandermaas/vim-ember-hbs'

" GOlang
Plug 'fatih/vim-go', { 'for': 'go' }

if has('nvim')
  Plug 'kassio/neoterm'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()


set lcs=tab:»\ ,trail:· list

set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
set foldenable
set guioptions-=T

set et sw=2 ts=2 ai
set ruler
set laststatus=2

" set relativenumber
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

let g:buffergator_suppress_keymaps=1

let test#strategy = 'dispatch'
map <leader>s :TestFile<cr>
map <leader>S :TestSuite<cr>
map <leader>n :TestNearest<cr>
map <leader>N :TestLast<cr>
map <leader>f :TestSuite --next-failure<cr>
map <leader>F :TestSuite --only-failure<cr>
" map <leader>w :!bundle exec cucumber -pwip<cr>
" map <leader>c :!bundle exec cucumber<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

let g:rooter_patterns = ['Rakefile', 'Gemfile', '.git/']

" keep consistent with fzf
noremap <leader>t :Files<cr>

map <leader>g :Ack <cword><cr>
" nmap <leader>p :CtrlP<cr>
" map <Leader>b :BuffergatorOpen<CR>

let g:ackprg = 'ag --vimgrep --smart-case'

" highlight last inserted text
nnoremap gV `[v`]

let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

hi! Normal cterm=NONE term=NONE ctermfg=12 ctermbg=NONE

let g:solarized_termtrans = 1
let g:ruby_indent_access_modifier_style = 'outdent'


let g:go_fmt_command = "goimports"
let g:airline_powerline_fonts = 1  " use  the powerline fonts
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

if has('nvim')
  " let test#strategy = 'neoterm'

  " leave terminal mode with escape
  tnoremap <Esc> <C-\><C-n>
endif

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

let g:ale_sign_error = "◊"
let g:ale_sign_warning = "•"
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning
let g:ale_fix_on_save = 1
let g:ale_echo_cursor = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:airline#extensions#ale#enabled = 1

map <leader>a :ALEFix<cr>

let g:ale_fixers = {
      \  'ruby': ['rubocop']
      \ }

" TmuxNavigator configs
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <ctrl>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <ctrl>j :TmuxNavigateDown<cr>
" nnoremap <silent> <ctrl>k :TmuxNavigateUp<cr>
" nnoremap <silent> <ctrl>l :TmuxNavigateRight<cr>
" nnoremap <silent> <ctrl>- :TmuxNavigatePrevious<cr>

" if has("nvim")
"   tnoremap <silent> <ctrl>h :TmuxNavigateLeft<cr>
"   tnoremap <silent> <ctrl>j :TmuxNavigateDown<cr>
"   tnoremap <silent> <ctrl>k :TmuxNavigateUp<cr>
"   tnoremap <silent> <ctrl>l :TmuxNavigateRight<cr>
"   tnoremap <silent> <ctrl>- :TmuxNavigatePrevious<cr>
" endif

syntax on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ex,*.exs set filetype=elixir

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType qf setlocal norelativenumber colorcolumn&

set mouse=a

" When mouse highlighting, copy to xsel buffer
" vmap <LeftRelease> "*ygv
" Copy unidentified buffers to system clipboard

if has("nvim")
  set clipboard=unnamedplus,unnamed
else
  set clipboard=autoselect,unnamedplus,unnamed,exclude:cons\|linux
endif

autocmd BufNewFile,BufRead .envrc set syntax=sh
