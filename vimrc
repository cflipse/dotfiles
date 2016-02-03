let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256


if has("autocmd")
  filetype indent plugin on
end

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rbenv'
"Plugin 'scrooloose/syntastic'

Plugin 'janko-m/vim-test'

Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'

Plugin 'elixir-lang/vim-elixir'

"Plugin 'CSApprox'

Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-abolish'
"Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'

Plugin 'altercation/vim-colors-solarized.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Colour-Sampler-Pack'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'rainerborene/vim-reek'
Plugin 'majutsushi/tagbar'

Plugin 'othree/html5.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'bling/vim-airline'
Plugin 'gundo'
Plugin 'ag.vim'
Plugin 'ctrlp.vim'

if has('nvim')
  Plugin 'kassio/neoterm'
endif

call vundle#end()


set lcs=tab:>·,trail:· list

set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=10
set foldenable
set guioptions-=T

set et sw=2 ts=2 ai
set ruler
set laststatus=2

set number
set colorcolumn=80
set autoread

set ic sc
set noshowmatch

set lazyredraw


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

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1  " use  the powerline fonts

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
