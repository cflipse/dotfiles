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
Plugin 'scrooloose/syntastic'

Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'

Plugin 'elixir-lang/vim-elixir'


Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-abolish'
"Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'

Plugin 'altercation/vim-colors-solarized.git'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'Colour-Sampler-Pack'
Plugin 'ndzou/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'rainerborene/vim-reek'
Plugin 'majutsushi/tagbar'

Plugin 'othree/html5.vim'
Plugin 'ngmy/vim-rubocop'

call vundle#end()


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

map <leader>t :!bundle exec rspec -fp %<cr>
map <leader>T :!bundle exec rspec -fp<cr>
map <leader>w :!bundle exec cucumber -pwip<cr>
map <leader>c :!bundle exec cucumber<cr>

map <leader>g :grep <cword><cr>

"set winheight=12
"set winminheight=7
"set winheight=1000


let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

hi! Normal cterm=NONE term=NONE ctermfg=12 ctermbg=NONE

let g:solarized_termtrans = 1
let g:ruby_indent_access_modifier_style = 'outdent'

Plugin 'bling/vim-airline'

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1  " use  the powerline fonts

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

syntax on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ex,*.exs set filetype=elixir

autocmd Filetype gitcommit setlocal spell textwidth=72
