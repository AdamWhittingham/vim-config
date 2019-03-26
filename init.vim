set nocompatible

if has('nvim')
  let vimDir = '$HOME/.config/nvim'
  let plugin_dir = expand(vimDir . '/plugins')
else
  let vimDir = '$HOME/.vim'
  let plugin_dir = expand(vimDir . '/plugged')
endif

call plug#begin(plugin_dir)

" ----------------------------------------------
" Define all the plugins!
" ----------------------------------------------

" UI
Plug 'airblade/vim-gitgutter'                                          " Show the column of changes to the file against git
Plug 'christoomey/vim-tmux-navigator'                                  " Move between Vim panes & Tmux panes easily
Plug 'mhinz/vim-startify'                                              " Start Vim with a more useful start screen
Plug 'regedarek/ZoomWin'                                               " Enable one pane to be fullscreened temporarily
Plug 'sjl/gundo.vim'                                                   " Visualise the undo tree and make it easy to navigate
Plug 'tpope/vim-repeat'                                                " Make many more operations repeatable with `.`

" Search and file exploring
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }      " Fuzzy search files
Plug 'junegunn/fzf.vim'                                                " Add nice FZF bindings

" Additional contextual information
Plug 'AdamWhittingham/vim-copy-filename'                               " Quick shortcuts for copying the file name, path and/or line number
Plug 'ludovicchabant/vim-gutentags'                                    " Better automated generation and update of ctags files
Plug 'tpope/vim-projectionist'                                         " Map tools and actions based on the project
Plug 'RRethy/vim-hexokinase'                                           " Show colour swatches on lines with hex or RGB colours

" Extra text manipulation and movement
Plug 'AndrewRadev/splitjoin.vim'                                       " Quick joining or splitting of programming constructs (ie. `if...else...` to `? ... : ...`)
Plug 'junegunn/vim-easy-align'                                         " Fast alignment of lines based on preset rules
Plug 'maxbrunsfeld/vim-yankstack'                                      " Paste text, then rotate though things yanked before/after
Plug 'tpope/vim-commentary'                                            " Quick toggle for code commenting
Plug 'tpope/vim-abolish'                                               " Allow smartcase substitution and search
Plug 'tpope/vim-surround'                                              " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
Plug 'tpope/vim-unimpaired'                                            " Motions to quickly add blank lines, move lines and create lists

" Autocomplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " Completion engine and languageserver
Plug 'tpope/vim-surround'                                              " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
Plug 'tpope/vim-endwise'                                               " Insert `end` into ruby when
Plug 'honza/vim-snippets'                                              " Add many popular shared snippets
Plug 'noahfrederick/vim-skeleton'                                      " Load a template when creating some files

" Language specific tools
Plug 'sheerun/vim-polyglot'                                            " Currated group of other excellent plugins
Plug 'adamwhittingham/vim-comb',       {'do': './install.sh'}          " Organise and format CSS selectors like a proper human
Plug 'hail2u/vim-css3-syntax'                                          " CSS3 syntax parsing


" Load any extra plugins specified in the home directory
if filereadable(expand("~/.vim.plugins.local"))
  source ~/.vim.plugins.local
endif

" No More plugins after here thanks!
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------

" Setup the leader key, used for triggering all kinds of awesome things
let mapleader = " "

" Set our primary colorscheme. Override this in ~/.vim.local if you want.
colorscheme adCode

set termguicolors                       " Use nicer colours in nvim
set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set background=dark
set backspace=start,indent,eol
set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
set breakindent
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set directory=/var/tmp,~/.tmp,.
set tabstop=2 shiftwidth=2 expandtab    " Convert tabs to 2 spaces AS IS RIGHT AND PROPER
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set formatoptions+=j                    " Delete comment characters when joining lines
set hidden                              " Allow buffer switching without saving
set history=1000                        " Remember a decent way back
set laststatus=2                        " Always show status line.
set listchars=nbsp:█,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set mousehide                           " Hide the mouse cursor when typing
set nofoldenable                        " Disable all folding of content
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2
set nowrap                              " Line wrapping off
set number                              " line numbers
set scrolloff=5                         " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shortmess+=A
set showbreak=↪                         " Show nicer symbol when a line is being wrapped
set signcolumn=yes                      " Show signcolumn all the time to avoid it popping in when gitgutter wakes up
set spelllang=en_gb
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set wildmode=list:longest               " Shell-like behaviour for command autocompletion

" Set undo data so it persists between sessions
if has('persistent_undo')
  let undo_dir = expand(vimDir . '/undo_data')
  let &undodir = undo_dir
  set undofile
endif

"" Setup statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
set statusline+=%#Visual#
set statusline+=\ %f:%l " file path and line number
set statusline+=\ %m " Modification flag

set statusline+=%= " Switch to the right hand side
set statusline+=%#CursorColumn#
set statusline+=\ %y " Filetype
set statusline+=\ %r " Read-only status
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\(%{&fileformat}\)
set statusline+=\ %l:%c
set statusline+=\

" -----------------------------------
" Setup file wildcard ignored names
" -----------------------------------

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.jar                " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass caches
set wildignore+=*/tmp/cache/*                                                " Ignore rails temporary asset caches
set wildignore+=node_modules/*                                               " Ignore node modules
set wildignore+=deps/*,_build/*                                              " Ignore Elixir & Phoenix deps and build
set wildignore+=*.swp,*.swo,*~,._*                                           " Disable temp and backup files

" -----------------------------------
" GUI Vim Options
" -----------------------------------
" Setup Font
if has('win32')
  set guifont=Consolas\ 10
elseif has('mac')
  set guifont=Menlo:h12
elseif has("unix")
  set guifont=DejaVu\ Sans\ Mono\ 10
endif
" if you don't have these fonts or want something else,
" set one in your ~/vim.local file like this:
"   set guifont=fontname\ 12

set guioptions-=T     " no toolbar
set guioptions-=m     " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars

" -----------------------------------
" Search Options
" -----------------------------------
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up

" ----------------------------------------------
" Setup highlighting
" ----------------------------------------------

" Show current line highlighting only in the active pane
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" Highlight Non-breaking spaces
highlight BadSpaces term=standout ctermbg=red guibg=red
match BadSpaces / \+/

" -----------------------------------
" Initialise Plugins
" -----------------------------------

call yankstack#setup()

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------

" Disable Ex Mode to remove confusion
nnoremap Q <Nop>

" make W and Q act like w and q
command! W :w
command! Q :q
command! Qa :qa

" make Y consistent with C and D
nnoremap Y y$

" Add jk as an escape sequence
imap jk <esc>

" <leader>. to view all document buffers
map <silent> <Leader>. :Buffers<cr>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" <Leader>c<space> to toggle comments on a line
map <silent> <leader>c<space> gcc

"  <Leader>f to fuzzy search files
map <silent> <leader>f :Files<cr>

"  <Leader>} to Search for a tag in the current project
map <silent> <leader>} :Tags<cr>

"  <Leader>{ to Search for a tag in the current buffer
map <silent> <leader>{ :BTags<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap a <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"  <Leader>g to jump to the next change since git commit
nmap <leader>g <Plug>GitGutterNextHunk

"  <Leader>G to jump to the last change since git commit
nmap <leader>G <Plug>GitGutterPrevHunk

"  <Leader>gt to toggle the gutter
nmap <leader>gt :GitGutterToggle<CR>

"  <Leader>gh highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" <Leager>ga to add the current git hunk to git staging
nmap <Leader>ga <Plug>GitGutterStageHunk

" <Leader>gu to undo the current changed hunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

"  <Leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

"  <Leader>H to show hidden characters
nmap <silent> <leader>H :set nolist!<CR>

" <Leader>i to reindent the current file
map <silent> <leader>i  mzgg=G`z

"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :Explore<CR>

"  <Leader>rt to run ctags on the current directory
map <leader>rt :!ctags -R .<CR><CR>

"  <Leader>s to split/expand lines
nmap <silent> <leader>s :SplitjoinSplit<cr>

"  <Leader>S to join/condense lines
nmap <silent> <leader>S :SplitjoinJoin<cr>

"  <Leader>sp to toggle spelling highlighting
nmap <silent> <Leader>sp :setlocal spell!<CR>

"  <Leader>sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

"  <Leader>u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" Replace the default U (undo last line) to Redo for speedyness
nmap U <c-r>

" Add :w!! to save the current file with sudo
cmap w!! w !sudo tee > /dev/null %

" Make saving & quiting just that little bit quicker
noremap <silent> <leader>x :x<CR>
noremap <silent> <leader>q :q<CR>

"  <Leader>z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

"  <Leader>= to switch to better style for projecting
noremap <silent> <leader>= :ToggleProjectorMode<CR>

"  <Leader>$ to toggle line wrap
map <silent> <leader>$ :set wrap!<CR>

if has('gui_running')
  " Ctrl+s to write the file (would scroll-lock Vim in the terminal!)
  map <C-s> <esc>:w<CR>
  imap <C-s> <esc>:w<CR>
endif

" Map <leader>* to search for the current work under the cursor in all files
nmap <leader>* <Plug>CtrlSFCwordExec

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" Show all references to the method/variable/etc under the cursor
nmap <silent> <c-[> <Plug>(coc-references)

" ----------------------------------------------
" Window split & size shortcuts
" ----------------------------------------------

" <leader> w for window commands
map <leader>w <c-w>w
map <leader>ws :vsplit<CR>
map <leader>wS :split<CR>
nnoremap <silent> <Leader>w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>w- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>w> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>w< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" C-w s to vertical split
map <C-w>s :vsplit<CR>

" C-w S to horizontal split
map <C-w>S :split<CR>

" C-h and C-l to jump left and right between splits
map <C-h> <C-w>h
map <C-l> <C-w>l
" C-J and C-K to jump down and up between splits
map <C-j> <C-w>j
map <C-k> <C-w>k

let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------

" MARKDOWN -------------------------------------
" Enable spell-check & wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap
autocmd BufNewFile,BufRead *.md :setlocal spell
let g:vim_markdown_folding_disabled=1

" YAML -------------------------------------
" Ignore blank lines when calculating indentaiton on ansible yml configs
let g:ansible_options = {'ignore_blank_lines': 0}
autocmd BufNewFile,BufRead *.yml :setlocal cursorcolumn
autocmd BufNewFile,BufRead *.yaml :setlocal cursorcolumn

" MAKE -------------------------------------
" Leave tabs as tabs in Makefiles
autocmd FileType make set noexpandtab

" Slim -------------------------------------
autocmd BufNewFile,BufRead *.slim :setlocal cursorcolumn

" ----------------------------------------------
" Auto-complete
" ----------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <c-l> pumvisible() ? "\<C-y>" : "\<c-l>"

" ----------------------------------------------
" File template settings
" ----------------------------------------------

let g:skeleton_replacements_ruby = {}

function! g:skeleton_replacements_ruby.CLASSNAME()
  let l:basename  = expand('%:t:r')
  let l:filename  = substitute(l:basename, "_spec", "", "")
  let l:camelcase = substitute(l:filename, '_\(\l\)', '\u\1', 'g')
  let l:mixedcase = substitute(l:camelcase, '^.', '\u&', '')
  return l:mixedcase
endfunction

let g:skeleton_find_template = {}

function! g:skeleton_find_template.ruby(path)
  if stridx(a:path, 'spec/') != -1
    return 'spec.rb'
  elseif stridx(a:path, '/controllers/') != -1
    return 'controller.rb'
  elseif stridx(a:path, '/model/') != -1
    return 'model.rb'
  elseif stridx(a:path, '/worker/') != -1
    return 'worker.rb'
  endif
  return ''
endfunction

" ----------------------------------------------
" Copy file path details to the system clipboard
" ----------------------------------------------

nmap <leader>cp :CopyRelativePath<CR>
nmap <leader>cP :CopyAbsolutePath<CR>
nmap <leader>cf :CopyFileName<CR>
nmap <leader>cd :CopyDirectoryPath<CR>
nmap <leader>cr :CopyRelativePathAndLine<CR>

" ----------------------------------------------
" Toggle line numbers between absolute and relative
" ----------------------------------------------

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

" ----------------------------------------------
" Setup Startify
" ----------------------------------------------

" Setup vim-startify's start screen
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 8
let g:startify_custom_header = [
      \ '   __      __            ',
      \ '   \ \    / (_)          ',
      \ '    \ \  / / _ _ __ ___  ',
      \ '     \ \/ / | | `_ ` _ \ ',
      \ '      \  /  | | | | | | |',
      \ '       \/   |_|_| |_| |_|',
      \ '                         ',
      \ ]

let g:startify_custom_footer = [
      \'',
      \"   Adam's Vim Config: https://github.com/adamwhittingham/vim-config",
      \"   Vim is charityware. Please read ':help uganda'",
      \]

let g:startify_list_order = [
      \ ['   Recent files in this directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

if has('nvim')
  let g:startify_bookmarks = [
        \ { 'v': '~/.config/nvim/init.vim' },
        \ { 't': '/tmp/foo.txt' },
        \ ]
else
  let g:startify_bookmarks = [
        \ { 'v': '~/.vim/vimrc' },
        \ { 't': '/tmp/foo.txt' },
        \ ]
endif

" Stop things splitting with Startify and replace it instead
autocmd User Startified setlocal buftype=

" ----------------------------------------------
" Setup SplitJoin
" ----------------------------------------------

" Attempt alignment of keys when splitting a hash
let g:splitjoin_align = 1

" ----------------------------------------------
" Setup FZF
" ----------------------------------------------

let g:fzf_layout = { 'down': '~75%' }

let g:fzf_colors =
      \ {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'String'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Boolean'],
      \ 'info':    ['fg', 'Comment'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

command! -nargs=* Ag
\ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('up:30%'))

" ----------------------------------------------
" Configure dynamic code execution tools
" ----------------------------------------------

" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
      \     "app/*.slim":                 { "alternate": "spec/{}.slim_spec.rb",                                    "type": "source"},
      \     "app/javascript/src/*.js":    { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
      \     "app/javascript/src/*.jsx":   { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
      \     "lib/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
      \     "spec/*_spec.rb":             { "alternate": ["app/{}.rb","lib/{}.rb"],                                 "type": "test"},
      \     "spec/javascript/*.test.js":  { "alternate": ["app/javascript/src/{}.js", "app/javascript/src/{}.jsx"], "type": "test"},
      \  }
      \}

" ----------------------------------------------
" Setup ctags
" ----------------------------------------------

" Tell Gutentags to store tags in .tags by default
let g:gutentags_ctags_tagfile = '.tags'

" ----------------------------------------------
" Setup File exploring
" ----------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3

autocmd FileType netrw nnoremap <buffer><silent>q :bd<CR>
autocmd FileType netrw nnoremap <buffer><silent>a %
autocmd FileType netrw nnoremap <buffer><silent>u -

" ----------------------------------------------
" Setup Colour highlighting/swatches
" ----------------------------------------------
let g:Hexokinase_ftAutoload = ['css', 'scss', 'sass', 'svg']
let g:Hexokinase_refreshEvents = ['TextChanged', 'TextChangedI']

" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------
" Ignore blank lines when calculating indentaiton on ansible yml configs
let g:ansible_options = {'ignore_blank_lines': 0}
let g:javascript_enable_domhtmlcss = 1

" Fix syntax issues for CSS elements with a dash in the name
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" ----------------------------------------------
" Configure GitGutter
" ----------------------------------------------
" Set the git gutter colors to be the same as the number column
hi clear SignColumn

" Set the Gutter to show all the time, avoiding the column 'pop' when saving
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~-'
let g:gitgutter_max_signs = 1000

" ----------------------------------------------
" Add Misc helpful functions
" ----------------------------------------------

" strip trailing whitespace
function! StripTrailingWhitespace()
	normal mz
	normal Hmy
	exec '%s/\s*$//g'
	normal 'yz<cr>
	normal `z
endfunction

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif