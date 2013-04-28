set nocompatible
call pathogen#infect()
filetype plugin indent on
syntax on

colorscheme darkermate

let mapleader = ","

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set guioptions-=T   " no toolbar
set guioptions-=m   " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars
set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set laststatus=2    " Always show status line.
set number          " line numbers
set scrolloff=3     " More context around cursor
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase
set smartcase
set hidden          " Allow buffer switching without saving
set history=1000
set wildmode=list:longest " Shell-like behaviour for command autocompletion
set mousehide
set cf              " Enable error files & error jumping.
set autowrite       " Writes on make/shell commands
set ruler           " Ruler on
set nowrap          " Line wrapping off
set timeoutlen=500
set cursorline
set tags=tags;./tags;
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent,eol

" ----------------------------------------------
" Setup Command Shortcuts
" ----------------------------------------------

" ,t to fuzzy search files
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Rebuild the cache whenever the search is invoked. Switch to the commented
" out line if this is too slow for you.
map <silent> <leader>t :ClearCtrlPCache<cr>\|:CtrlP<cr>
"map <silent><Leader>t <esc>:CtrlP<CR>

" Ctrl+s to write the file
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" Add ,. for viewing all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" ,p to switch to better font for projector
noremap <silent> <leader>p :ToggleProjectorMode<CR>

" ,c to show hidden characters
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>c :set nolist!<CR>

" ,h to toggle search result highlighting
:noremap <silent> <leader>h :set hls!<CR>

" ,w to toggle line wrap
:map <silent> <Leader>w :set wrap!<CR>

" ,f to find current file in NERDTree
map <silent> <Leader>f :NERDTreeFind<CR>

" ,u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" ,, to run current spec file
map <Leader>, :wa\|:Dispatch rspec %<CR>

" ,s to toggle spelling highlighting
nmap <silent> <Leader>s :setlocal spell! spelllang=en_gb<CR>

" ,s' to cycle single quote, double quotes and symbol
let g:speckyQuoteSwitcherKey = "<Leader>s'"

" ,sx to switch between spec and implementation
let g:speckySpecSwitcherKey = "<Leader>sx"

" ,ss to run spec
let g:speckyRunSpecKey = "<Leader>ss"
"
" ,m to toggle file tree
nmap <silent> <Leader>m :NERDTreeToggle<CR>

" ,tt to tabulate visually selected rows based on |
vnoremap <silent> <Leader>tt :call Tabularize('/\|/')<CR>

" ,t> to align visually selected lines by =>
vnoremap <silent> <Leader>t> :Align =><CR>

" ,t{ to align visually selected lines by =>
vnoremap <silent> <Leader>t{ :Align {<CR>

" ,z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

" ,rt to force a refresh of tags
map <Leader>rt :!run_tags<CR><CR>

" ,sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

" Ctrl+Alt+p to view the Vim style of the text under the cursor
nmap <C-A-P> :call <SID>SynStack()<CR>

" ,cC to show colour references in that colour (color_hightlight)
" ,cF to toggle showing the colour on the text or background (color_hightlight)

" C-w s to vertical split
map <C-w>s :vsplit<CR>

" C-w S to horizontal split
map <C-w>S :split<CR>

" C-A-h and C-A-l to resize vertical split
map <C-A-h> :vertical resize -7<CR>
map <C-A-l> :vertical resize +7<CR>

" C-A-j and C-A-k to resize horizontal split
map <C-A-j> :resize -5<CR>
map <C-A-k> :resize +5<CR>

" C-H and C-L to jump left and right between splits
map <C-h> <C-w>h
map <C-l> <C-w>l
"
" C-J and C-K to jump down and up between splits
map <C-j> <C-w>j
map <C-k> <C-w>k

" ,] to toggle the tags sidebar
nmap <Leader>] :TagbarToggle<CR>

" C-c to copy to the global buffer
vmap <A-c> "+y<CR>

" C-v to paste from the global buffer
map <A-v> "+p<CR>

" - to switch code blocks with the switch plugin
map - :Switch<CR>

" It's not like :W is bound to anything anyway.
command! W :w

" Alternatives to ESC
imap jkl <ESC>
imap jlk <ESC>
imap kjl <ESC>
imap klj <ESC>
imap lkj <ESC>
imap ljk <ESC>
imap ;l <ESC>
imap jk <ESC>
imap kj <ESC>

" Better increment & decrement numbers (C-a is nicer for tmux/screen)
nmap ++ <C-a>
nmap -- <C-x>

" ----------------------------------------------
" Setup Misc Vim Behaviours
" ----------------------------------------------

" Setup the projector toggle plugin
let g:default_colorscheme = 'darkermate'
let g:projector_colorscheme = 'mac-classic'

" Display soft column limit in modern versions of vim
if version >= 730
  au WinEnter,FileType * set cc=
  au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=140
endif

autocmd FileType make set noexpandtab

" Treat scss files as css
au BufRead,BufNewFile *.scss set filetype=css

" Extend % to do/end etc
runtime! plugin/matchit.vim

" Select a sensible font based on environment
if has('win32')
  set guifont=Consolas\ 10
elseif has('mac')
  set guifont=Menlo:h10
else
  set guifont=DejaVu\ Sans\ Mono\ 10
  " if you aren't using Ubuntu, set another default font here!
endif

" Ruby debugger settings
if has('gui')
  if has("mac")
    let g:ruby_debugger_progname = 'mvim'
  else
    let g:ruby_debugger_progname = 'gvim'
  endif
  map <Leader>dg :Rdebugger<CR>
  map <Leader>dr :RdbTest<CR>
endif

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

let g:speckyWindowType = 1

let g:ragtag_global_maps = 1

" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

"autocmd VimEnter * NERDTree
autocmd VimEnter * call s:NERDTreeIfDirectory(expand("<amatch>"))
autocmd VimEnter * wincmd p
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" If the parameter is a directory (including implicit '.'), open NERDTree
function s:NERDTreeIfDirectory(directory)
  if isdirectory(a:directory) || a:directory == ""
    NERDTree
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  if isdirectory(a:directory)
    call ChangeDirectory(a:directory)
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(stay)
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      if !a:stay
        wincmd p
      end
    endif
  endif
endfunction

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1
  call s:UpdateNERDTree(stay)
endfunction

function Touch(file)
  execute "!touch " . a:file
  call s:UpdateNERDTree(1)
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . a:file
  endif
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . a:file

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")
"call s:DefineCommand("e", "Edit") " if you don't mind not being able to "e!"

" Folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3     "deepest fold is 3 levels
set nofoldenable      "dont fold by default

" Jump to last cursor position when opening a file
" Don't do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal g`\""
    endif
  end
endfunction

" make Y consistent with C and D
nnoremap Y y$

" strip trailing whitespace<foo&bar>
"autocmd BufWritePre,FileWritePre * call StripTrailingWhitespace()
function! StripTrailingWhitespace()
	normal mz
	normal Hmy
	exec '%s/\s*$//g'
	normal 'yz<cr>
	normal `z
endfunction

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

function! OpenInBrowser(url)
  if has("mac")
    exec '!open '.a:url
  else
    exec '!firefox -new-tab '.a:url.' &'
  endif
endfunction

" Open the Ruby ApiDock page for the word under cursor
function! OpenRubyDoc(keyword)
  let url = 'http://railsapi.com/doc/ruby-v1.8/?q='.a:keyword
  call OpenInBrowser(url)
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR><CR>

" Open the Rails ApiDock page for the word under cursor
function! OpenRailsDoc(keyword)
  if filereadable('config/application.rb')
    let url = 'http://railsapi.com/doc/rails-v3.0.4/?q='.a:keyword
  else
    let url = 'http://railsapi.com/doc/rails-v2.3.8/?q='.a:keyword
  endif
  call OpenInBrowser(url)
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR><CR>

" :SudoW to save file using sudo (must be already authorised, eg sudo -v)
command! -bar -nargs=0 SudoW   :silent exe "write !sudo tee % >/dev/null"|silent edit!

" Edit routes
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,html,less,scss,vim'
" Make colorizer play nicely with 2html
let g:colorizer_syntax = 1

" ----------------------------------------------
"  Last, but not least, source any local config
" ----------------------------------------------

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
