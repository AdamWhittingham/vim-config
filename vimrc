set nocompatible
call pathogen#infect()
filetype plugin indent on
syntax on

colorscheme darkermate

let mapleader = ","

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------

set autoindent
set autowrite       " Writes on make/shell commands
set backspace=start,indent,eol
set cf              " Enable error files & error jumping.
set cursorline
set expandtab
set hidden          " Allow buffer switching without saving
set history=1000
set laststatus=2    " Always show status line.
set mousehide
set nowrap          " Line wrapping off
set number          " line numbers
set ruler           " Ruler on
set scrolloff=3     " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shiftwidth=2
set smarttab
set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set tabstop=2
set timeoutlen=500
set wildmode=list:longest " Shell-like behaviour for command autocompletion
set fillchars+=vert:\  "Set the window borders to not have | chars in them

" GVim Options
set guioptions-=T   " no toolbar
set guioptions-=m   " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars

" Search options
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase
set smartcase

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------

" - to switch code blocks with the switch plugin
map - :Switch<CR>

" -- to decrement numbers
nmap -- <C-x>
"  ++ to increment numbers (C-a is nicer for tmux/screen)
nmap ++ <C-a>

" make W write, just as w
command! W :w

" make Y consistent with C and D
nnoremap Y y$

" ,. to view all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" ,, to run current spec file
map <Leader>, :wa\|:Dispatch rspec %<CR>

" ,] to toggle the tags sidebar
nmap <Leader>] :TagbarToggle<CR>

" ,c to show hidden characters
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>c :set nolist!<CR>

" ,cC to show colour references in that colour (color_hightlight)
" ,cF to toggle showing the colour on the text or background (color_hightlight)
" Provided configured by colorizer

" ,f to find current file in NERDTree
map <silent> <Leader>f :NERDTreeFind<CR>

" ,g to jump to the next change since git commit
" ,G to jump to the last change since git commit
nmap <leader>g <Plug>GitGutterNextHunk
nmap <leader>G <Plug>GitGutterPrevHunk

" ,gt to toggle the gutter
nmap <leader>gt :GitGutterToggle<CR>

" ,gh yo highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" ,h to toggle search result highlighting
:noremap <silent> <leader>h :set hls!<CR>

" ,m to toggle file tree
nmap <silent> <Leader>m :NERDTreeToggle<CR>

" ,p to switch to better font for projector
noremap <silent> <leader>p :ToggleProjectorMode<CR>

" ,s to toggle spelling highlighting
nmap <silent> <Leader>s :setlocal spell! spelllang=en_gb<CR>

" ,sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

" ,t to clear cache and fuzzy search files; ,T in current file's directory
" Rebuilds the cache first, move to commented out line to just search
map <silent> <leader>t :ClearCtrlPCache<cr>\|:CtrlP<cr>
map <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlPCurFile<cr>
"map <silent><Leader>t <esc>:CtrlP<CR>

" ,tt to tabulate visually selected rows based on |
vnoremap <silent> <Leader>tt :call Tabularize('/\|/')<CR>

" ,t> to align visually selected lines by =>
vnoremap <silent> <Leader>t> :Align =><CR>

" ,t{ to align visually selected lines by =>
vnoremap <silent> <Leader>t{ :Align {<CR>

" ,u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" ,w to toggle line wrap
:map <silent> <Leader>w :set wrap!<CR>

" ,z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

" C-c to copy to the global buffer
vmap <A-c> "+y<CR>

" C-v to paste from the global buffer
map <A-v> "+p<CR>

" Ctrl+s to write the file (Will scroll-lock Vim in the terminal!)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Ignores files in any VCS or tmp directory
set wildignore+=tmp/*,*.so,*.swp,*.zip

" Ctrl+\ to view the Vim style of the text under the cursor
nmap <C-\> :call <SID>SynStack()<CR>

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" ----------------------------------------------
" Window split & size shortcuts
" ----------------------------------------------

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


" ----------------------------------------------
" <ESC> Shortcuts
" ----------------------------------------------

imap jkl <ESC>
imap jlk <ESC>
imap kjl <ESC>
imap klj <ESC>
imap lkj <ESC>
imap ljk <ESC>
imap ;l <ESC>
imap jk <ESC>
imap kj <ESC>

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

let g:ragtag_global_maps = 1

" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it. Helps recover screen
" space!
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" If the parameter is a directory (or there was no parameter), open NERDTree
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

" Add function for showing the syntax tag for the selected text
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,html,less,scss,vim'

" Make colorizer play nicely with 2html
let g:colorizer_syntax = 1

" Enable wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap

" Setup relative number toggle on Ctrl+n
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" ----------------------------------------------
"  Setup Ctags support
" ----------------------------------------------

" Don't highlight tags by default
let g:easytags_auto_highlight = 0

" Name to check for local tags file
set tags=./tags;

" Specify which tags files to use
" (0 for global, 1 for local if exists, else global, 2 for local only)
let g:easytags_dynamic_files = 2

" Follow symlinks when looking for tags
let g:easytags_resolve_links = 1

" Also scan for class/struct members
let g:easytags_include_members = 1

" ----------------------------------------------
"  Set the git gutter colors to be the same as the number column
" ----------------------------------------------
hi clear SignColumn

" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!
" ----------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
