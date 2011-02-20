let mapleader=','

runtime! debian.vim
set nocompatible

syntax on
call pathogen#runtime_append_all_bundles('bundle')

set background=dark 
set lcs=eol:$,tab:>·,trail:·

set foldmethod=syntax
set foldlevel=2
set guioptions-=T

set et
set sw=2
set ts=2

set ai
set si

if has("automcd")
  filetype indent plugin on


  autocmd BufNewFile,BufRead *.rb      map <f5> :!ruby -rubygems %<cr>
  autocmd BufNewFile,BufRead *.rb      map <f6> :!spec -rubygems %<cr>
  autocmd BufNewFile,BufRead *_spec.rb map <f5> :!spec -rubygems -rspec %<cr>
  autocmd BufNewFile,BufRead *.rb      map <f6> :!spec -rubygems -rspec %<cr>
end

runtime macros/matchit.vim


" use makegreen 
"autocmd BufNewFile,BufRead *_spec.rb compiler rspec
"autocmd BufWritePost *_spec.rb make %

call pathogen#runtime_append_all_bundles() 
