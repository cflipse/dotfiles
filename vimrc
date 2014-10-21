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

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rbenv'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'godlygeek/tabular'

Plugin 'bling/vim-airline'


Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-abolish'
"Plugin 'tpope/vim-endwise'

Plugin 'vim-ruby/vim-ruby'
"Plugin 'Colour-Sampler-Pack'
Plugin 'ndzou/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized.git'
"Plugin 'rainerborene/vim-reek'
"Plugin 'bronson/vim-runtest'

Plugin 'othree/html5.vim'

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

map <leader>t :!rspec -fp %<cr>
map <leader>T :!rspec -fp<cr>
map <leader>w :!cucumber -pwip<cr>
map <leader>c :!cucumber<cr>

map <leader>g :grep <cword><cr>

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





function! LoadAndDisplayRSpecQuickfix()
  let quickfix_filename = ".git/quickfix.out"
  if filereadable(quickfix_filename) && getfsize(quickfix_filename) != 0
    silent execute ":cfile " . quickfix_filename
    botright cwindow
    cc
  else
    redraw!
    echohl WarningMsg | echo "Quickfix file " . quickfix_filename . " is missing or empty." | echohl None
  endif
endfunction

noremap <Leader>q :call LoadAndDisplayRSpecQuickfix()<cr>



let g:ruby_indent_access_modifier_style = 'outdent'
let g:airline_powerline_fonts = 1  " use  the powerline fonts
let g:airline_theme='solarized'


autocmd BufNewFile,BufReadPost *.md set filetype=markdown
