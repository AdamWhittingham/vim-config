set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ----------------------------------------------
" Define all the plugins!
" ----------------------------------------------

Plugin 'gmarik/Vundle.vim'

Plugin 'AdamWhittingham/projector_mode'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AutoTag'
Plugin 'ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kana/vim-fakeclip'
Plugin 'bogado/file-line'
Plugin 'bufexplorer.zip'
Plugin 'colorizer'
Plugin 'digitaltoad/vim-jade'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'groenewege/vim-less'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'plasticboy/vim-markdown'
Plugin 'regedarek/ZoomWin'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vroom'

if filereadable(expand("~/.vim.plugins.local"))
  source ~/.vim.plugins.local
endif

" ----------------------------------------------
" No More plugins after here thanks!
" ----------------------------------------------
call vundle#end()
filetype plugin indent on
syntax on

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------

let mapleader = ","
" Space is a vary popular leader key, so make it mimic leader
nmap <space> <leader>
nmap <space><space> <leader><leader>

colorscheme adCode

set autoindent
set autowrite       " Writes on make/shell commands
set backspace=start,indent,eol
set cf              " Enable error files & error jumping.
set cursorline
set expandtab
set hidden          " Allow buffer switching without saving
set history=1000    " Remember a decent way back
set laststatus=2    " Always show status line.
set mousehide
set nofoldenable    " Disable all folding of content
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jar,.git/*,.svn/* " Ignores files in any VCS or tmp directory
set wildmode=list:longest " Shell-like behaviour for command autocompletion
set fillchars+=vert:\  "Set the window borders to not have | chars in them

" GVim Options
set guioptions-=T     " no toolbar
set guioptions-=m     " no menu
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

" make W and Q act like w and q
command! W :w
command! Q :q
command! Qa :qa

" make Y consistent with C and D
nnoremap Y y$

" <leader>. to view all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" <leader>] to toggle the tags sidebar
nmap <Leader>] :TagbarToggle<CR>

" <leader>a<?> to align visually selected lines on <something>
vnoremap <silent> <Leader>a= :Tabularize /=<CR>
vnoremap <silent> <Leader>a=> :Tabularize /=>/l1c1r1<CR>
vnoremap <silent> <Leader>a, :Tabularize /,\@<=/l0r1<CR>
vnoremap <silent> <Leader>a{ :Tabularize /{<CR>
vnoremap <silent> <Leader>a\| :Tabularize /\|<CR>
vnoremap <silent> <Leader>a: :Tabularize /\w:\zs/l0l1<CR>
vnoremap <silent> <Leader>a<space> :Tabularize /[^ ] \+\zs/l0r1<CR>

"  <Leader>f to clear cache and fuzzy search files; ,F in current file's directory
map <silent> <leader>f :ClearCtrlPCache<cr>\|:CtrlP<cr>
map <silent> <leader>F :ClearCtrlPCache<cr>\|:CtrlPCurFile<cr>

"  <Leader>g to jump to the next change since git commit
"  <Leader>G to jump to the last change since git commit
nmap <leader>g <Plug>GitGutterNextHunk
nmap <leader>G <Plug>GitGutterPrevHunk

"  <Leader>gt to toggle the gutter
nmap <leader>gt :GitGutterToggle<CR>

"  <Leader>gh highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

"  <Leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

"  <Leader>H to show hidden characters
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>H :set nolist!<CR>

"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :NERDTreeToggle<CR>
map <silent> <Leader>M :NERDTreeFind<CR>

"  <Leader>p to switch to better font for projector
noremap <silent> <leader>p :ToggleProjectorMode<CR>

"  <Leader>rt to run ctags on the current directory
map <leader>rt :!ctags -R .<CR><CR>

"  <Leader>s and ,S to split and join lines
nmap <silent> <leader>s :SplitjoinSplit<cr>
nmap <silent> <leader>S :SplitjoinJoin<cr>

"  <Leader>sp to toggle spelling highlighting
nmap <silent> <Leader>sp :setlocal spell! spelllang=en_gb<CR>

"  <Leader>sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

"  <Leader>t to run tests
map <silent> <leader>t :VroomRunTestFile<CR>
map <silent> <leader>T :VroomRunNearestTest<CR>

"  <Leader>u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

"  <Leader>w to toggle line wrap
map <silent> <Leader>w :set wrap!<CR>

"  <Leader>z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

" A-c to copy to the global buffer
vmap <A-c> "+y<CR>

" A-v to paste from the global buffer
map <A-v> "+p<CR>

" Ctrl+s to write the file (Will scroll-lock Vim in the terminal!)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Ctrl+\ to view the Vim style of the text under the cursor
nmap <C-\> :call <SID>SynStack()<CR>

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" ----------------------------------------------
" Insert Mode Abbreviations
" ----------------------------------------------

" Try to auto-complete xml tags on typing '</'
iabbrev </ </<C-X><C-O>

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
" Map Uncommon Filetype for Syntax Highlighting
" ----------------------------------------------

au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.jade.html set filetype=jade
au BufRead,BufNewFile *.palette set filetype=ruby

" ----------------------------------------------
" Setup Look & Feel
" ----------------------------------------------

" Setup the projector toggle plugin
let g:default_colorscheme = 'adCode'
let g:projector_colorscheme = 'mac-classic'

" Setup Font
if has('win32')
  set guifont=Consolas\ 9
elseif has('mac')
  set guifont=Menlo:h11
else
  set guifont=DejaVu\ Sans\ Mono\ 9
  " if you don't have these fonts, set one in your ~/vim.local file like this:
  " set guifont=fontname\ 10
endif

" Display soft column limit in modern versions of vim
if version >= 730
  au WinEnter,FileType * set cc=
  au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=140
endif

" ----------------------------------------------
" Setup Misc Vim Behaviours
" ----------------------------------------------

" Setup vim-airline to look nicer
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = "powerlineish"

autocmd FileType make set noexpandtab

" Extend % to do/end etc
runtime! plugin/matchit.vim

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it. Helps recover screen space!
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

"define :Hipster command to dump in a paragraph of Hipster ipsum
command! -nargs=0 Hipster :normal iTrust fund fashion axe bitters art party
      \ raw denim. XOXO distillery tofu, letterpress cred literally gluten-free
      \ flexitarian fap. VHS fashion axe gluten-free 90's church-key, kogi
      \ hashtag Marfa. Kogi Tumblr Brooklyn chambray. Flannel pickled YOLO
      \ semiotics. Mlkshk keffiyeh narwhal, mumblecore gentrify raw denim food
      \ truck DIY. Craft beer chia readymade ethnic, hella kogi Vice jean shorts
      \ cliche cray mlkshk ugh cornhole kitsch quinoa

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,haml,html,less,scss,vim'

" Make colorizer play nicely with 2html
let g:colorizer_syntax = 1

" Enable wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap

" Setup relative number toggle on Ctrl+n
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
  set number
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Set ctrlp to ignore files in the VCS directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.bzr|tmp|log|public|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll|swp|DS_Store|zip|jar)$',
  \ }

"  Set the git gutter colors to be the same as the number column
hi clear SignColumn

" Set the Gutter to show all the time, avoiding the column 'pop' when saving
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'

" Vroom settings
let g:vroom_write_all = 1
let g:vroom_cucumber_path = 'cucumber '
let g:vroom_map_keys = 0

" xmp-filter mappings
autocmd FileType ruby nmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader>X <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>x <Plug>(xmpfilter-run)

" Disable Markdown folding
let g:vim_markdown_folding_disabled=1

" Don't report Angular ng-* attributes as errors in HTML
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":       {"alternate": "spec/{}_spec.rb", "type": "source"},
      \     "lib/*.rb":       {"alternate": "spec/{}_spec.rb", "type": "source"},
      \     "spec/*_spec.rb": {"alternate": ["app/{}.rb","lib/{}.rb"], "type": "test"}
      \  }
      \}

" If using a Mac set the paste buffers to use the OS X Clipboard
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
  set clipboard=unnamed
endif

" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!
" ----------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
