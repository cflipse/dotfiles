let mapleader=','


runtime! debian.vim

syntax on

call pathogen#runtime_append_all_bundles('bundle')

set background=dark 

set lcs=eol:$,tab:>·,trail:·

set foldmethod=syntax
set foldlevel=2
set guioptions-=T

set et
set sw=4
set ts=4

set ai
set si

autocmd BufNewFile,BufRead *.rb      map <f5> :!ruby -rubygems %<cr>
autocmd BufNewFile,BufRead *.rb      map <f6> :!spec -rubygems %<cr>
autocmd BufNewFile,BufRead *_spec.rb map <f5> :!spec -rubygems -rspec %<cr>
autocmd BufNewFile,BufRead *.rb      map <f6> :!spec -rubygems -rspec %<cr>


" use makegreen 
"autocmd BufNewFile,BufRead *_spec.rb compiler rspec
"autocmd BufWritePost *_spec.rb make %


" FIND PATHOGEN -- plugin manager
" Command-T (better than fuzzy-finder)
