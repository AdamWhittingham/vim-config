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
Plug 'AdamWhittingham/projector_mode'                         " Toggle between colourschemes for work & projection or screensharing
Plug 'airblade/vim-gitgutter'                                 " Show the column of changes to the file against git
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline
Plug 'christoomey/vim-tmux-navigator'                         " Move between Vim panes & Tmux panes easily
Plug 'vim-scripts/colorizer'                                  " Show the colour off Hex colour codes
Plug 'mhinz/vim-startify'                                     " Start Vim with a more useful start screen
Plug 'Yggdroot/indentLine'                                    " Show indentation level guides
Plug 'regedarek/ZoomWin'                                      " Enable one pane to be fullscreened temporarily
Plug 'sjl/gundo.vim'                                          " Visualise the undo tree and make it easy to navigate
Plug 'tpope/vim-repeat'                                       " Make many more operations repeatable with `.`

" Search and file exploring
Plug 'jlanzarotta/bufexplorer'                                " Show a sortable list of open buffers
if executable('fzf')
  Plug 'junegunn/fzf'                                           " User FZF for fuzzy finding files
  Plug 'junegunn/fzf.vim'                                       " Add nice FZF bindings for tags
else
  Plug 'ctrlpvim/ctrlp.vim'                                     " Really powerful fuzzy finder for file names
end
Plug 'brookhong/ag.vim'                                       " Add better searching with ag
Plug 'dyng/ctrlsf.vim'                                        " Aysnc search for text in all files
Plug 'scrooloose/nerdtree'                                    " Visualise the project directory and make it easy to navigate
Plug 'tpope/vim-unimpaired'                                   " Extra bindings for common buffer navigation
Plug 'timakro/vim-searchant'                                  " Better highlighting when searching in file

" Additional contextual information
Plug 'AdamWhittingham/vim-copy-filename'                      " Quick shortcuts for copying the file name, path and/or line number
Plug 'gregsexton/MatchTag'                                    " Highlight the matching opening or closing tag in HTML/XML
Plug 'ludovicchabant/vim-gutentags'                           " Better automated generation and update of ctags files
Plug 'tpope/vim-projectionist'                                " Map tools and actions based on the project

" Extra text manipulation and movement
Plug 'AndrewRadev/splitjoin.vim'                              " Quick joining or splitting of programming constructs (ie. `if...else...` to `? ... : ...`)
Plug 'AndrewRadev/switch.vim'                                 " Quickly switch programming constructs between alternate version (ie. Ruby string to symbol)
Plug 'junegunn/vim-easy-align'                                " Fast alignment of lines based on preset rules
Plug 'maxbrunsfeld/vim-yankstack'                             " Paste text, then rotate though things yanked before/after
Plug 'tpope/vim-commentary'                                   " Quick toggle for code commenting
Plug 'tpope/vim-abolish'                                      " Allow smartcase substitution and search
Plug 'tpope/vim-surround'                                     " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
Plug 'wellle/targets.vim'                                     " Add lots of extra text objects for brachets, quotes, args and more
Plug 'dhruvasagar/vim-table-mode'                             " Add some pretty powerful tools for creating ASCII tables

" Autocomplete
Plug 'jiangmiao/auto-pairs'                                   " Auto add paired characters (and try not to be too annoying about it)
Plug 'noahfrederick/vim-skeleton'                             " Use a template file when creating new files
if has('nvim')
  Plug 'ncm2/ncm2'                                              " Add auto-complete
  Plug 'roxma/nvim-yarp'                                        " Allow Autocomplete to run async
  Plug 'ncm2/ncm2-bufword'                                      " Complete based on words in buffers
  Plug 'ncm2/ncm2-tmux'                                         " Complete based on words in tmux
  Plug 'ncm2/ncm2-path'                                         " Complete based on paths
  Plug 'ncm2/ncm2-cssomni'                                      " Complete based on CSS keywords
  Plug 'ncm2/ncm2-ultisnips'                                    " Complete based on Snippets
  Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}             " Auto-complete JS
  Plug 'roxma/ncm-rct-complete'                                 " Auto-complete Ruby
else
  Plug 'ervandew/supertab'                                      " Make tab more useful in triggering Vim omni-complete
  Plug 'tpope/vim-ragtag'                                       " Provide bindings for closing HTML/XML tags
  Plug 'ajh17/VimCompletesMe'                                   " Very lightweight completion helper
endif

" Snippets
Plug 'SirVer/ultisnips'                                       " Add snippet expantion for all kinds of template formats
Plug 'honza/vim-snippets'                                     " Add many popular shared snippets

" Extra syntax highlighting and language support
if has('nvim')
  Plug 'w0rp/ale'                                               " Syntax highlight & lint multiple languages as you type
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Add LanguageServer support for enhanced autocompletion
else
  Plug 'scrooloose/syntastic'                                   " The Godfather of all syntax highlighting and checking
endif
Plug 'sheerun/vim-polyglot'                                   " Currated group of other excellent plugins
Plug 'niquola/vim-hl7',                {'for': 'hl7'}         " HL7 syntax highlighting
Plug 'slashmili/alchemist.vim'                                " Hook into Elixir Alchemist server for better completions'
Plug 'janko-m/vim-test'                                       " Add test running support for lots of languages & test frameworks

" Ruby
Plug 'tpope/vim-endwise'                                      " Automatically end code blocks as inserted
Plug 'ecomba/vim-ruby-refactoring',    {'for': 'ruby'}        " Extra Ruby refactoring tools
Plug 'vim-scripts/rubycomplete.vim',   {'for': 'ruby'}        " Extend OmniComplete with live evaluated Ruby

" Elixir
Plug 'avdgaag/vim-phoenix',            {'for': 'elixir'}      " Add Projectionist, Dispatch and Mix integrations for Phoenix projects

" JS, CSS & HTML
Plug 'adamwhittingham/vim-comb',       {'do': './install.sh'} " Organise and format CSS selectors like a proper human
Plug 'hail2u/vim-css3-syntax'                                 " CSS3 syntax parsing


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

" Comma has been the leader key for so long, emulate it being the leader still
" for the sake of muscle memory
map , <leader>
map ,, <leader><leader>


" Set our primary colorscheme. Override this in ~/.vim.local if you want.
colorscheme adCode
if has('nvim')
  set termguicolors                     " Use nicer colours in nvim
endif

set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set background=dark
set backspace=start,indent,eol
set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
set breakindent
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set cursorline                          " Hilight the line the cursor is on
set directory=/var/tmp,~/.tmp,.
set expandtab                           " Convert tabs to spaces AS IS RIGHT AND PROPER
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set formatoptions+=j
set hidden                              " Allow buffer switching without saving
set history=1000                        " Remember a decent way back
set laststatus=2                        " Always show status line.
set listchars=nbsp:█,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set mousehide                           " Hide the mouse cursor when typing
set nofoldenable                        " Disable all folding of content
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2
set nowrap                              " Line wrapping off
set number                              " line numbers
set ruler                               " Ruler on
set scrolloff=3                         " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shiftwidth=2
set shortmess+=A
set showbreak=↪                         " Show nicer symbol when a line is being wrapped
set signcolumn=yes                      " Show signcolumn all the time to avoid it popping in when gitgutter wakes up
set smarttab
set spelllang=en_gb
set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set t_Co=256                            " Set 256 colour mode
set tabstop=2                           " Make a tab = 2 spaces
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set wildmode=list:longest               " Shell-like behaviour for command autocompletion

" Set undo data so it persists between sessions
if has('persistent_undo')
  let undo_dir = expand(vimDir . '/undo_data')
  let &undodir = undo_dir
  set undofile
endif

" Display soft column limit in modern versions of vim
if version >= 730
  au WinEnter,FileType * set cc=
  au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=140
endif

" Show lines which have been break-indented with a special character
if v:version > 704 || v:version == 704 && has("patch338")
  set breakindent
  set showbreak=↪
endif

" Delete comment character when joining commented lines
 if v:version > 703 || v:version == 703 && has("patch541")
   set formatoptions+=j
 endif

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

" ----------------------------------------------
" Configure font & colourscheme
" ----------------------------------------------
" Setup the projector toggle plugin
let g:default_colorscheme = 'adCode'
let g:projector_colorscheme = 'mac-classic'

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


" -----------------------------------
" Search Options
" -----------------------------------
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up


" -----------------------------------
" GUI Vim Options
" -----------------------------------
set guioptions-=T     " no toolbar
set guioptions-=m     " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars


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
nmap <silent> <unique> <Leader>. :BufExplorer<CR>
nmap <silent> <unique> ,. :BufExplorer<CR>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" <leader>a<?> to align visually selected lines on <something>
vnoremap <silent> <Leader>a= :Tabularize /=<CR>
vnoremap <silent> <Leader>a=> :Tabularize /=>/l1c1r1<CR>
vnoremap <silent> <Leader>a, :Tabularize /,\@<=/l0r1<CR>
vnoremap <silent> <Leader>a{ :Tabularize /{<CR>
vnoremap <silent> <Leader>at :Tabularize /\|<CR>
vnoremap <silent> <Leader>a\| :Tabularize /\|<CR>
vnoremap <silent> <Leader>a: :Tabularize /\w:\zs/l0l1<CR>
vnoremap <silent> <Leader>a<space> :Tabularize /[^ ] \+\zs/l0r1<CR>

" Start interactive EasyAlign in visual mode (e.g. vipa)
vmap aa <Plug>(LiveEasyAlign)

" <Leader>c<space> to toggle comments on a line
map <silent> <leader>c<space> gcc

if executable('fzf')
  "  <Leader>f to fuzzy search files
  map <silent> <leader>f :GFiles<cr>

  "  <Leader>} to Search for a tag in the current project
  map <silent> <leader>} :Tags<cr>

  " Add <leader>/ to search all files via Ag
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag search: ')<CR>
else
  "  <Leader>f to fuzzy search files
  map <silent> <leader>f :CtrlP<cr>

  "  <Leader>} to Search for a tag in the current project
  map <silent> <leader>} :CtrlPTag<cr>
end

"  <Leader>F to fuzzy search files for the given text
map <silent> <leader>F <Plug>CtrlSFPrompt

"  <Leader>g to jump to the next change since git commit
nmap <leader>g <Plug>GitGutterNextHunk

"  <Leader>G to jump to the last change since git commit
nmap <leader>G <Plug>GitGutterPrevHunk

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" <Leader>ig to toggle indent guidelines
map <silent> <leader>ig :IndentLinesToggle<CR>

"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :NERDTreeToggle<CR>

"  <Leader>M to toggle file tree, selecting the current file
map <silent> <Leader>M :NERDTreeFind<CR>

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

"  <Leader>t to run all tests in the current file if it is a test, otherwise
"  run the last test file
map <silent> <leader>t :TestFile<CR>

"  <Leader>t to run the tests in the scope nearest the cursor
map <silent> <leader>T :TestNearest<CR>

"  <Leader>u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" Replace the default U (undo last line) to Redo for speedyness
nmap U <c-r>

" Toggle the display of the side bar with tags in
nnoremap <Leader>] :TagbarToggle<CR>

" Add :w!! to save the current file with sudo
cmap w!! w !sudo tee > /dev/null %

" Make saving & quiting just that little bit quicker
noremap <silent> <leader>w :w<CR>
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

" Replace the default U (undo last line) to Redo for speedyness
nmap U <c-r>

" Map <leader>* to search for the current work under the cursor in all files
nmap <leader>* <Plug>CtrlSFCwordExec

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" F6 to view the Vim style of the text under the cursor
nmap <F6> :call VimSyntaxGroups()<CR>


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

" Add a hack to fix c-h in tmux + nvim on macOS
" See the [tmux navigator](https://github.com/christoomey/vim-tmux-navigator) readme for more
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" C-J and C-K to jump down and up between splits
map <C-j> <C-w>j
map <C-k> <C-w>k

let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" ----------------------------------------------
" Map Uncommon Filetype for Syntax Highlighting
" ----------------------------------------------

au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.jade.html set filetype=jade
au BufRead,BufNewFile *.palette set filetype=ruby
au BufNewFile,BufRead *.hl7 set filetype=hl7


" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,haml,html,less,scss,vim'

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

" RUBY -------------------------------------
" Extend % to do/end etc
runtime! plugin/matchit.vim

" Enable ragtag XML tag mappings
let g:ragtag_global_maps = 1

" Slim -------------------------------------
autocmd BufNewFile,BufRead *.slim :setlocal cursorcolumn

" ----------------------------------------------
" Auto-complete
" ----------------------------------------------

" Enable omni completion.
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Recommended key-mappings.

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-x>"
imap <C-l> <C-x>
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if has('nvim')
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  endfunction

  " <TAB>: completion.
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Enable NCM2
  autocmd BufEnter * call ncm2#enable_for_buffer()
endif

" note that must keep noinsert in completeopt, the others is optional
set completeopt=noinsert,menuone,noselect

" Setup language server support

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

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
" Setup CtrlP File Finder
" ----------------------------------------------

let g:ctrlp_show_hidden = 1

" Use Ag for search if its available on this system
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif


" ----------------------------------------------
" Setup CtrlSF Text finder
" ----------------------------------------------

let g:ctrlsf_position = 'bottom'
let g:ctrlsf_populate_qflist = 1


" ----------------------------------------------
" Setup SplitJoin
" ----------------------------------------------

" Attempt alignment of keys when splitting a hash
let g:splitjoin_align = 1

" ----------------------------------------------
" Setup FZF colours
" ----------------------------------------------

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
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
      \ 'header':  ['fg', 'Comment'] }

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
      \     "spec/views/*.slim_spec.rb":  { "alternate": "app/views/{}.slim",                                       "type": "test"},
      \     "spec/*_spec.rb":             { "alternate": ["app/{}.rb","lib/{}.rb"],                                 "type": "test"},
      \     "spec/javascript/*.test.js":  { "alternate": ["app/javascript/src/{}.js", "app/javascript/src/{}.jsx"], "type": "test"},
      \  }
      \}


" ----------------------------------------------
" Setup ALE linting tools
" ----------------------------------------------

let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1      " Always show the sign column to avoid annoying popping in
let g:ale_lint_delay = 1000           " Lint at most once per second incase we're on battery power

highlight clear ALEErrorSign
highlight clear ALEWarningSign

hi ALEErrorSign   guibg=#501010 ctermbg=52 guifg=#FD3F44 ctermfg=203
hi ALEWarningSign guibg=#503010 ctermbg=58 guifg=#FF9800 ctermfg=208

let b:ale_linters = {'ruby': ['rubocop', 'ruby'], 'python': ['flake8'], 'cloudformation': ['cfn-lint']}

" ----------------------------------------------
" Setup customer Switch changes
" ----------------------------------------------


let g:switch_custom_definitions =
      \ [
      \   ['X', '✔', '✕'],
      \   ['yes', 'no']
      \ ]

" ----------------------------------------------
" Setup the status bar
" ----------------------------------------------

" Set POWERLINE in your env to active powerline-font support
" for example, in your .bashrc add:
" export POWERLINE=1

if $POWERLINE
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tagbar#enabled = 1
else
  let g:airline_section_z = '%c, %l/%L'
  let g:airline#extensions#tagbar#enabled = 0
end

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 1

let g:airline_theme = "kalisi"


" ----------------------------------------------
" Configure Buffer Explorer
" ----------------------------------------------
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDisableDefaultKeyMapping=1

" ----------------------------------------------
" Setup ctags
" ----------------------------------------------

" Tell Gutentags to store tags in .tags by default
let g:gutentags_ctags_tagfile = '.tags'

let g:tagbar_type_ansible = {
      \   'ctagstype' : 'ansible',
      \   'kinds' : [
      \     't:tasks'
      \   ],
      \   'sort' : 0
      \ }

let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \   'kinds'     : [
      \     'c:classes',
      \     's:selectors',
      \     'i:identities'
      \   ]
      \ }

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \   'f:functions',
      \   'functions:functions',
      \   'c:callbacks',
      \   'd:delegates',
      \   'e:exceptions',
      \   'i:implementations',
      \   'a:macros',
      \   'o:operators',
      \   'm:modules',
      \   'p:protocols',
      \   'r:records'
      \ ]
      \ }

let g:tagbar_type_ruby = {
      \   'kinds' : [
      \     'm:modules',
      \     'c:classes',
      \     'd:describes',
      \     'c:contexts',
      \     'C:constants',
      \     'f:methods',
      \     'F:singleton methods',
      \     's:specs',
      \     'S:scopes',
      \     'a:associations',
      \     'r:relations',
      \     'h:callbacks',
      \     'i:tests',
      \   ]
      \ }

" ----------------------------------------------
" Setup NERDTree
" ----------------------------------------------
" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it.
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're always using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------

" Enable spell-check & wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap
autocmd BufNewFile,BufRead *.md :setlocal spell

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
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_max_signs = 1000

" ----------------------------------------------
" Configure Indent guidelines
" ----------------------------------------------

let g:indentLine_char = '│'
let g:indentLine_fileType = ['yaml', 'slim', 'coffee', 'python']

" ----------------------------------------------
" Configure Testing tools
" ----------------------------------------------

" Vroom (Ruby) settings
let g:vroom_write_all = 1
let g:vroom_cucumber_path = 'cucumber '
let g:vroom_map_keys = 0


" Disable Markdown folding
let g:vim_markdown_folding_disabled=1

" Show current line highlighting only in the active pane
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Enable ragtag XML tag mappings
let g:ragtag_global_maps = 1


" ----------------------------------------------
" Add Misc helpful functions
" ----------------------------------------------

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

" strip trailing whitespace
function! StripTrailingWhitespace()
	normal mz
	normal Hmy
	exec '%s/\s*$//g'
	normal 'yz<cr>
	normal `z
endfunction

" Display Vim syntax groups under the cursor
function! VimSyntaxGroups()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction

" Add function for showing the syntax tag for the selected text
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
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

"define :Hipster command to dump in a paragraph of Hipster ipsum
command! -nargs=0 Hipster :normal iTrust fund fashion axe bitters art party
      \ raw denim. XOXO distillery tofu, letterpress cred literally gluten-free
      \ flexitarian fap. VHS fashion axe gluten-free 90's church-key, kogi
      \ hashtag Marfa. Kogi Tumblr Brooklyn chambray. Flannel pickled YOLO
      \ semiotics. Mlkshk keffiyeh narwhal, mumblecore gentrify raw denim food
      \ truck DIY. Craft beer chia readymade ethnic, hella kogi Vice jean shorts
      \ cliche cray mlkshk ugh cornhole kitsch quinoa


" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
