let vimDir = '$HOME/.vim'

let plugin_dir = expand(vimDir . '/plugins')

call plug#begin(plugin_dir)

" ----------------------------------------------
" Define all the plugins!
" ----------------------------------------------

" UI
Plug 'airblade/vim-gitgutter'                                     " Show the column of changes to the file against git
Plug 'christoomey/vim-tmux-navigator'                             " Move between Vim panes & Tmux panes easily
Plug 'folke/tokyonight.nvim'                                      " Color scheme with great support for plugins
Plug 'kyazdani42/nvim-web-devicons'                               " Add icons and colours to search results based on filetype
Plug 'mbbill/undotree'                                            " Visualise the undo tree and make it easy to navigate
Plug 'mhinz/vim-startify'                                         " Start Vim with a more useful start screen
Plug 'nvim-telescope/telescope.nvim'                              " Powerful UI for searching and file traversing
Plug 'regedarek/ZoomWin'                                          " Enable one pane to be fullscreened temporarily
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }         " Show color swatches

" Common dependencies
Plug 'nvim-lua/plenary.nvim'                                      " Library of common LUA helpers, dependency of many other plugins
Plug 'nvim-lua/popup.nvim'                                        " LUA bindings for pop-up windows, dependency of Telescope
"
" Navigation & Search tools
Plug 'tpope/vim-projectionist'                                    " Map tools and actions based on the project
Plug 'AdamWhittingham/vim-copy-filename'                          " Quick shortcuts for copying the file name, path and/or line number
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }               " Add FZF for faster searching for items under the cursor
Plug 'junegunn/fzf.vim'                                           " and bind it up nicely
Plug 'nvim-treesitter/playground'                                 " Show the Treesitter results and highlight under cursor

" Additional contextual information
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}       " Fantastic langauge parsing
Plug 'nvim-treesitter/nvim-treesitter-refactor'                   " Add refactoring module for renaming
Plug 'neovim/nvim-lspconfig'                                      " LSP Connectivity
Plug 'kabouzeid/nvim-lspinstall'                                  " Make it easy to install LSP servers
Plug 'ray-x/lsp_signature.nvim'

" Autocomplete
Plug 'hrsh7th/nvim-compe'                                         " Completion engine which can pull from many sources
Plug 'hrsh7th/vim-vsnip'                                          " Snippet engine which follows the LSP/VSCode snippet format
Plug 'hrsh7th/vim-vsnip-integ'                                    " Integrations which allow vim-snip to integrate with Treesitter
Plug 'noahfrederick/vim-skeleton'                                 " Load a template when creating some files
Plug 'wellle/tmux-complete.vim'                                   " Add tmux as a source for completions
"
" Extra text manipulation and movement
Plug 'AndrewRadev/splitjoin.vim'                                  " Quick joining or splitting of programming constructs (ie. `if...else...` to `? ... : ...`)
Plug 'AndrewRadev/switch.vim'                                     " Quickly swap between true/false, different hash styles and much more
Plug 'editorconfig/editorconfig-vim'                              " Make use of EditorConfig files
Plug 'junegunn/vim-easy-align'                                    " Fast alignment of lines based on preset rules
Plug 'kshenoy/vim-signature'                                      " Show marks in the gutter to help me use them more
Plug 'maxbrunsfeld/vim-yankstack'                                 " Paste text, then rotate though things yanked before/after
Plug 'tpope/vim-abolish'                                          " Allow smartcase substitution and search
Plug 'tpope/vim-commentary'                                       " Quick toggle for code commenting
Plug 'tpope/vim-endwise'                                          " Insert `end` into ruby when
Plug 'tpope/vim-repeat'                                           " Make many more operations repeatable with `.`
Plug 'tpope/vim-surround'                                         " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
Plug 'wellle/targets.vim'                                         " Additional text objects and motions

" Language specific tools
Plug 'vim-scripts/icalendar.vim'                                  " Syntax for iCal files

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
"
colorscheme adcode

set t_Co=256                            " Use 256-bit colour in vim
set termguicolors                       " Use nicer colours in nvim
set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set background=dark
set backspace=start,indent,eol
set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
set breakindent
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set completeopt=menuone,noselect
set directory=/var/tmp,~/.tmp,.         " Set the directory for working files created by vim
set tabstop=2 shiftwidth=2 expandtab    " Convert tabs to 2 spaces AS IS RIGHT AND PROPER
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set formatoptions+=j                    " Delete comment characters when joining lines
set hidden                              " Allow buffer switching without saving
set history=1000                        " Remember a decent way back
set laststatus=2                        " Always show status line.
set lazyredraw                          " Skip redraw when applying macros and scripts
set listchars=trail:•,tab:»•,nbsp:␣
set mousehide                           " Hide the mouse cursor when typing
set nofoldenable                        " Disable all folding of content
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2
set nowrap                              " Line wrapping off
set number                              " line numbers
set scrolloff=5                         " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shortmess=aFc
set showbreak=↪                         " Show nicer symbol when a line is being wrapped
set signcolumn=yes                      " Show signcolumn all the time to avoid it popping in when gitgutter wakes up
set spelllang=en_gb
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set updatetime=300                      " Lower the default update time for more speeed
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

" -----------------------------------
" Setup file wildcard ignored names
" -----------------------------------

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.jar                " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/vendor/bundle/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass caches
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

" Deal with my sloppy shift-release
command! Qa :qa

" make Y consistent with C and D
nnoremap Y y$

" Add add blank line above/below current line
nnoremap ]<space> m`o<Esc>``
nnoremap [<space> m`O<Esc>``

" Add line moving shortcuts
map <silent>[e :m -2<cr>
map <silent>]e :m +1<cr>

" <leader>. to view all document buffers
map <silent> <Leader>. :Telescope buffers theme=get_dropdown<cr>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" <Leader>d to show the directory tree
nmap <silent> <Leader>d :Telescope file_browser<CR>

"  <Leader>f to fuzzy search files
map <silent> <leader>f :Files<cr>

"  <Leader>F to fuzzy search content
map <silent> <leader>F :Telescope live_grep<cr>

"  <Leader>} to Search for a tag in the current project
map <silent> <leader>} :Telescope lsp_workspace_symbols<cr>

"  <Leader>{ to Search for a tag in the current buffer
map <silent> <leader>{ :Telescope treesitter<cr>

" Jump to the definitionof this tag
nmap <silent> <c-]> :Telescope lsp_definitions<cr>

" Show all references to the method/variable/etc under the cursor
nmap <silent> <leader>] :Telescope lsp_references<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga) or a motion/text object (e.g. gaip)
vmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(EasyAlign)

" <leader>gc to show commits in this file
nmap <Leader>gc :BCommits<cr>

" <Leader>gd to jump to the next change since git commit
nmap <Leader>gd <Plug>(GitGutterPreviewHunk)
"
" <Leader>gn/gN/gp to jump to the next/prev change since git commit
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>gN <Plug>(GitGutterPrevHunk)

" <Leader>gh highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" <Leager>ga to add the current git hunk to git staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)

" <Leader>gu to undo the current changed hunk
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" <Leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

" <Leader>H to show hidden characters
nmap <silent> <leader>H :set nolist!<CR>

" <Leader>i to reindent the current file
map <silent> <leader>i  m`gg=G``

" <leader>m to set mark
noremap <leader>m `

" Rename the tag under the cursor
" Setup in the nvim-treesitter-refactor config
" nmap <leader>r -> rename

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

" Leader t/T to send the current file/line to rspec via tmux windows
nmap <leader>t :call InvokeViaTmux("rspec", expand("%:p"))<CR>
nmap <leader>T :call InvokeViaTmux("rspec", expand("%:p") . ":" . line('.'))<CR>

"  <Leader>u to toggle undo history browser
nnoremap <Leader>u :UndotreeToggle<CR>

" Add :w!! to save the current file with sudo
cmap w!! w !sudo tee > /dev/null %

"  <Leader>z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

"  <Leader>$ to toggle line wrap
map <silent> <leader>$ :set wrap!<CR>

if has('gui_running')
  " Ctrl+s to write the file (would scroll-lock Vim in the terminal!)
  map <C-s> <esc>:w<CR>
endif

" Map <leader>* to search for the current work under the cursor in all files
nmap <leader>* :Ag <C-r>=expand('<cword>')<CR><CR>

" F3 to run rubocop
map <silent> <F3> <esc>:! rubocop -a %<CR>

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" F10 to show the syntax group under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <F9> :TSHighlightCapturesUnderCursor<CR>

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

" GIT COMMITS ----------------------------------
" Start in insert mode when editing a commit message
au FileType gitcommit 1 | startinsert

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
autocmd BufNewFile,BufRead *.yml :setlocal spell
autocmd BufNewFile,BufRead *.yaml :setlocal spell

" MAKE -------------------------------------
" Leave tabs as tabs in Makefiles
autocmd FileType make set noexpandtab

" Slim -------------------------------------
autocmd BufNewFile,BufRead *.slim :setlocal cursorcolumn

" CSS -------------------------------------
" Fix syntax issues for CSS elements with a dash in the name
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" iCal -------------------------------------
augroup icalendar_ft
  au!
  autocmd BufNewFile,BufRead *.ics   set syntax=icalendar
augroup END


" ----------------------------------------------
" Language Server Setup
" ----------------------------------------------

lua <<EOF
-- Setup installed LSP servers
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-- Setup lsp_signature
require "lsp_signature".on_attach()
EOF

" ----------------------------------------------
" Setup Treesitter
" ----------------------------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "ruby",
    "javascript",
    "css",
    "scss",
    "go",
    "yaml",
    "lua",
    "html",
    "json",
    "comment",
    "regex",
    "bash",
    "python",
    "typescript"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>r",
      },
    },
  },
}
EOF

" ----------------------------------------------
" Setup Telescope
" ----------------------------------------------

lua << EOF
require('telescope').setup{
  defaults = {
    selection_caret = "➜ ",
    file_ignore_patterns = {
      'tags',
      'vendor/.*'
    },
    layout_strategy = flex,
    winblend = 20,
    width = 0.8,
    show_line = false,
    prompt_title = false,
    results_title = false,
    preview_title = false,
  }
}
EOF

" ----------------------------------------------
" Auto-complete
" ----------------------------------------------

" Use tab to trigger completion with characters ahead and navigate.
" I know nested ternaries are a crime but I don't want to spend 30 lines on
" this.
imap <expr> <Tab>   pumvisible() ? "\<C-n>" : vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' :  "\<Tab>"
smap <expr> <Tab>   pumvisible() ? "\<C-n>" : vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' :  "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' :  "\<S-Tab>"
smap <expr> <S-Tab> pumvisible() ? "\<C-p>" : vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' :  "\<S-Tab>"

lua << EOF
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 2;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
      tmux = true;
      treesitter = true;
    };
  }
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-l>     compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

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
"
" ----------------------------------------------
" Code snippets config
" ----------------------------------------------

let g:vsnip_snippet_dir = expand(vimDir . '/snippets')

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
let g:startify_change_to_vcs_root = 0
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_custom_indices = ['a', 's', 'd', 'f']

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
" Configure dynamic code execution tools
" ----------------------------------------------

" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
      \     "app/javascript/src/*.js":    { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
      \     "app/javascript/src/*.jsx":   { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
      \     "lib/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
      \     "spec/*_spec.rb":             { "alternate": ["app/{}.rb","lib/{}.rb"],                                 "type": "test"},
      \     "spec/javascript/*.test.js":  { "alternate": ["app/javascript/src/{}.js", "app/javascript/src/{}.jsx"], "type": "test"},
      \  },
      \ "*_test.go": {
      \    "*.go":       { "alternate": "{}_test.go", "type": "test" },
      \    "*_test.go":  { "alternate": "{}.go",      "type": "source" },
      \  }
      \}

" ----------------------------------------------
" Setup File exploring
" ----------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3

autocmd FileType netrw nnoremap <buffer><silent>q :bd<CR>
autocmd FileType netrw nnoremap <buffer><silent>a %
autocmd FileType netrw nnoremap <buffer><silent>u -

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
" Setup TokyoNight
" ----------------------------------------------

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 'true'
let g:tokyonight_transparent = 'true'

"colorscheme tokyonight

" ----------------------------------------------
" Add Misc helpful functions
" ----------------------------------------------

" strip trailing whitespace
function! StripTrailingWhitespace()
	normal m`
	exec '%s/\s*$//'
	normal ``
endfunction

function! InvokeViaTmux(cmd, test)
  let l:targetWindow = trim(system('tmux list-windows | grep "test" | cut -f1 -d":" | head -1'))
  if empty(l:targetWindow)
    let l:targetWindow = 3
  endif
  let l:target = "-t " . l:targetWindow . ".1"
  let l:command = "tmux send-keys" . " " . l:target . ' "' . a:cmd . " "  . a:test . '" Enter'
  echom "Running " . a:test . " in window " . l:targetWindow
  let output = system(l:command)
endfunction

" define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

set pyx=3

" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
