let mapleader=','

runtime! debian.vim
set nocompatible

syntax on
call pathogen#infect()

set background=dark 
set lcs=eol:$,tab:>·,trail:·

set foldmethod=syntax
set foldlevel=2
set guioptions-=T

"color solarized
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey  guibg=darkgrey



set et
set sw=2
set ts=2

set ai

if has("automcd")
  filetype indent plugin on
end

runtime macros/matchit.vim



" Vim functions to run RSpec and Cucumber on the current file and optionally on
" the spec/scenario under the cursor. Within the context of a Rails app, will
" prefer script/spec and script/cucumber over their system counterparts.

" yanked and modified from https://gist.github.com/266351
function! RailsScriptIfExists(name)
  " Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
  " Script directory
  elseif exists("b:rails_root") && filereadable(b:rails_root . "/script/" . a:name)
    return b:rails_root . "/script/" . a:name
  " System Binary
  else
    return a:name
  end
endfunction

function! RunSpec(args)
  let spec = RailsScriptIfExists("rspec")
  let cmd = spec . " " . a:args . " -fn -c " . @%
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunCucumber(args)
  let cucumber = RailsScriptIfExists("cucumber")
  let cmd = cucumber . " " . @% . a:args
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile(args)
  if @% =~ "\.feature$"
    call RunCucumber("" . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("" . a:args)
  end
endfunction

function! RunTest(args)
  if @% =~ "\.feature$"
    call RunCucumber(":" . line('.') . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("-l " . line('.') . a:args)
  end
endfunction
map <leader>T :call RunTestFile("")<cr>
map <leader>t :call RunTest("")<cr>

"autocmd BufRead,BufWritePost *_spec.rb call RunTestFile("")
