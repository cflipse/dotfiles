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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'

Bundle 'vim-ruby/vim-ruby'
Bundle 'Colour-Sampler-Pack'
Bundle 'Solarized'



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

"set winheight=12
"set winminheight=7
"set winheight=1000


let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

autocmd Filetype gitcommit setlocal spell textwidth=72


autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
          \ if expand('%') =~# '_test\.rb$' |
          \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
          \ elseif expand('%') =~# '_spec\.rb$' |
          \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
          \ else |
          \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
          \ endif
autocmd User Bundler
          \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif
