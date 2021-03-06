let mapleader=','
runtime! debian.vim
runtime macros/matchit.vim
set nocompatible

" all my terminals are full color....
set t_Co=256


call plug#begin('~/.vim/plugged')
Plug 'kana/vim-textobj-user'

Plug 'tpope/vim-projectionist'

Plug 'direnv/direnv.vim'

Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'benmills/vimux'
Plug 'skywind3000/asyncrun.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'othree/html5.vim'
Plug 'parkr/vim-jekyll'

" Plug 'mhinz/vim-grepper'
Plug 'junegunn/vim-easy-align'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

" Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-bundler'

Plug 'dense-analysis/ale'

" GIT
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-fireplace', { 'for': 'elixir' }
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }

" JS
Plug 'joukevandermaas/vim-ember-hbs'

" GOlang
" Plug 'fatih/vim-go', { 'for': 'go' }

if has('nvim')
  Plug 'kassio/neoterm'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()


set lcs=tab:»\ ,trail:· list

set foldmethod=syntax
set foldlevelstart=5
set foldminlines=3
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

set viewdir="~/.vim/view"

let g:netrw_banner=0
let g:buffergator_suppress_keymaps=1

map <leader>b :Buffers<cr>

let test#strategy = 'vimterminal'
if has('nvim')
  let test#strategy = 'neovim'
endif
if exists('$TMUX')
  " let test#strategy = 'vtr'
endif

map <leader>ss :TestFile<cr>
map <leader>sa :TestSuite<cr>
map <leader>sk :TestNearest<cr>
map <leader>sl :TestLast<cr>
map <leader>sn :TestSuite --next-failure<cr>
map <leader>sf :TestSuite --only-failure<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" command! ProjectFiles execute 'Files' s:find_git_root()
" let g:rooter_patterns = ['Rakefile', 'Gemfile', '.git/']

" keep consistent with fzf
noremap <leader>t :Files<cr>
nnoremap <leader>fg :Ag <cword><cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fC :Commits<cr>
nnoremap <leader>fc :BCommits<cr>

"set grepprg=ag\ --vimgrep
set grepprg=ag\ --vimgrep\
set grepformat=%f:%l:%c:%m


command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

runtime plugin/grepper.vim
"let g:grepper.tools = ['ag', 'git', 'grep']
"
" runtime plugin/grepper.vim
" let g:grepper.tools = ['rg', 'git', 'grep']

" nnoremap <leader>gr :Grepper<cr>
" let g:grepper.prompt_mapping_tool = '<leader>g'

" nnoremap <leader>gg :Grepper -tool git<cr>
" nnoremap <leader>ga :Grepper <cr>
" nnoremap <leader>gs :Grepper -side<cr>
" nnoremap <leader>*  :Grepper -cword -noprompt<cr>

" let g:grepper.prompt_mapping_tool = '<leader>g'

" command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|XXX):'

"let g:grepper.prompt_mapping_tool = '<leader>g'


" highlight last inserted text
nnoremap gV `[v`]

" configure jekyll
let g:jekyll_post_extension = '.md'


let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

hi! Normal cterm=NONE term=NONE ctermfg=12 ctermbg=NONE

let g:solarized_termtrans = 1

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

if has('vim')
  tnoremap <Esc> <C-W>N
endif

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:ale_sign_error = "◊"
let g:ale_sign_warning = "•"
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning
let g:ale_fix_on_save = 0
let g:ale_echo_cursor = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_ruby_rubocop_executable='bundle'

let g:airline#extensions#ale#enabled = 1

map <leader>af :ALEFix<cr>
map <leader>ai :ALEDetail<cr>
map <leader>ac :ALEComplete
map <leader>adb :ALEDisableBuffer
map <leader>adg :ALEDisable
map <leader>aeb :ALEEnableBuffer
map <leader>aeg :ALEEnable
map <leader>ag :ALEGoToDefinitionInSplit<cr>

let g:ale_fixers = { 'ruby': ['rubocop'] }
let g:ale_linters = { 'ruby': [ 'rubocop', 'ruby', 'sorbet' ] }
let g:ale_ruby_standardrb_executable = 'bundle'

" TmuxNavigator configs
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <c--> :TmuxNavigatePrevious<cr>

if has("nvim")
  " tnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  " tnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  " tnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  " tnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  " tnoremap <silent> <c--> :TmuxNavigatePrevious<cr>
endif

" TmuxRunner Configs

nmap <leader>rf :VtrFocusRunner<cr>
nmap <leader>rx :VtrReorientRunner<cr>
map <leader>rr :VtrSendLinesToRunner<cr>

syntax on

" Include tags
set tags^=./.git/tags;

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ex,*.exs set filetype=elixir

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType qf setlocal norelativenumber colorcolumn&

set mouse=a

" When mouse highlighting, copy to xsel buffer
" vmap <LeftRelease> "*ygv
" Copy unidentified buffers to system clipboard

if has("nvim")
  set clipboard=unnamedplus
else
  set clipboard=unnamedplus
endif

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10})
endfunction
nnoremap z= :call FzfSpell()<CR>

autocmd BufNewFile,BufRead .envrc set syntax=sh

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if $TERM_PROFILE == 'dark'
  set background=dark
elseif $TERM_PROFILE == 'light'
  set background=light
endif
