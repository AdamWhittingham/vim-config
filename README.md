An awesome Vim config for development, slow roasted with a Ruby twist and a shot of web-dev.

# Installing
Assuming you already have vim, just run:
```bash
    git clone https://github.com/AdamWhittingham/vim-config.git ~/.vim && ~/.vim/install
```

You may get an issue along the lines of `access denied` you'll need to make the newly cloned file executable with:
```bash
    chmod +x ~/.vim/install
```
Then run it again with:
```bash
    ~/.vim/install
```

Should this not leave you with a nice working vim (certain vims are a bit iffy about the last line) then launch vim and run `:PluginUpdate`

If you are using zsh there may be an issue running tests with ,t (it can't find the bundle). If you don't already have an /etc/zprofile file it can be fixed by doing the following:

```bash
    sudo mv /etc/zshenv /etc/zprofile
```
more details here: http://vim.1045645.n5.nabble.com/MacVim-and-PATH-td3388705.html#a3392363


## External Dependencies
There are a couple of things you might want to install to get the best out of this config:
* ctags - enables tags support when working with code
* Ag - enables grepping through the current directories with [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* Ack - enables grepping through the current directories with Ack-grep. Only needed if you can't (or won't) install Ag.
* rcodetools - enables execution of ruby in-editor, run `gem install rcodetools`

# Updating
```bash
    cd ~/.vim
    git pull
```
If you've installed the auto-update hook, the git pull should trigger Vim to update and you're done!

Manually update by opening Vim and running `:PluginUpdate` and `:PluginClean`.

# Personalisation
We all like things a little differently, so there are a couple of ways to easily tweak and add to the config.

## Add more plugins
Simply write normal Bundle plugin lines to `~/.vim.plugins.local`

## Set up options and add more functions
Changes like using a different font or colour scheme can be made by writing Vim config into `~/.vimrc.local`

# Using the config
## The Leader Key
A large number of the useful commands in Vim start with the 'leader' key, so Vim knows something cool is about to happen.

For this config, the leader is the comma button. This is shown in the following notes as `,`

## Plugins - all the goodies!
See the plugins' web pages for more information. The keybindings listed are mostly
just those defined or overridden locally, not the ones provided by default.

### Ack
This plugin is a front for the Perl module App::Ack. Ack can be used as a replacement for 99% of the uses of grep.
(more)[http://www.vim.org/scripts/script.php?script_id=2572]

**Important:** Requires ack (aka ack-grep) to be installed.


### Ag
This plugin is a front for Ag. Ag can be used as a replacement for 153% of the uses of Ack.

**Important:** Requires [the_silver_surfer](https://github.com/ggreer/the_silver_searcher) to be installed

### Autotag
Automatically update tags when saving files ([more](http://www.vim.org/scripts/script.php?script_id=1343))

### bufexplorer
Buffer explorer/browser ([more](http://www.vim.org/scripts/script.php?script_id=42))

Keys      | Function
----------|--------------------
  `,` `.` | Show buffer explorer


### Coffeescript
Adds support for CoffeeScript. It handles syntax, indenting, and compiling ([more](http://www.vim.org/scripts/script.php?script_id=3590))


### color_highlight
Highlight color names and codes in the same color that they represent ([more] (http://www.vim.org/scripts/script.php?script_id=3963))

Keys       | Function
-----------|------------------------------------
  `,` `cC` | Toggle colour highlighting
  `,` `cF` | Toggle text or background colouring


### CtrlP
Fast file navigation for VIM ([more](https://github.com/kien/ctrlp.vim))

Keys           | Function
---------------|--------------------
  `Ctrl` + `p` | Open the CtrlP fuzzy search
  `,` `f`      | Refresh the cache and open the CtrlP fuzzy search
  `,` `F`      | Open CtrlP searching for files in the same directory as the current file

Once the search window is open, you can use the following:

Keys       | Function
-----------|--------------------
`F5`       | Purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
`Ctrl`+`f` | Cycle between things to search (files, buffers, recently used files)
`Ctrl`+`d` | Switch to filename only search instead of full path.
`Ctrl`+`r` | Switch to regexp mode.
`Ctrl`+`j`, `<c-k>` or the arrow keys | Navigate the result list.
`Ctrl`+`t` or `<c-v>`, `<c-x>` | Open the selected entry in a new tab or in a new split.


### Endwise
Auto completion of 'end' in Ruby ([more](https://github.com/tpope/vim-endwise))


### Elixir
Elixir language support ([more](https://github.com/elixir-lang/vim-elixir))


### Gundo
Gundo is a Vim plugin for visualizing your undo tree to make it usable ([more](http://www.vim.org/scripts/script.php?script_id=3304))

Keys      | Function
----------|--------------------
  `,` `u` | Toggle Gundo tree


### markdown
Syntax highlighting for Markdown ([more](http://plasticboy.com/markdown-vim-mode/))


### machit
Allows % to be changed to match more than single characters; often more up-to-date than the version which ships with Vim. ([more](http://www.vim.org/scripts/script.php?script_id=39))


### nerdcommenter
A plugin that allows for easy commenting of code for many filetypes ([more](http://www.vim.org/scripts/script.php?script_id=1218))

Keys             | Function
-----------------|--------------------
  `,` `c{space}` | Comment/Uncomment this line


### nerdtree
A tree explorer plugin for navigating the filesystem ([more](http://www.vim.org/scripts/script.php?script_id=1658))

Keys      | Function
----------|--------------------
  `,` `m` | Show/hide NERDTree
  `,` `f` | Show current file in tree
  `C`     | Set the current folder to be the root of the tree
  `p`     | Go to parent of selected item
  `?`     | Toggle the help list


### projector mode
Toggle 'projector mode': larger font and high contrast colour scheme ([more](https://github.com/AdamWhittingham/projector_mode))

Keys      | Function
----------|--------------------
  `,` `v` | Toggle 'projector mode' (large font, high contrast)


### Projectionist
Map different files and folders to groups ([more](https://github.com/tpope/vim-projectionist))
If you want to be a Vim legend, you really should brush up on what this excellent plugin does!

Keys      | Function
----------|---------------------------------------------
  `:` `A` | Toggle between Ruby production code and spec


### repeat
Use the repeat command (.) with supported plugins ([more](http://www.vim.org/scripts/script.php?script_id=2136))


### ruby-xmpfilter

Helper for ruby's xmpfilter ([more](https://github.com/t9md/vim-ruby-xmpfilter))

Annotate ruby code with the result of running it, Ruby Tapas style. Press ,X to
append a '# =>' to a line, then ,x to execute the file and insert all results.

**Important:** You need to install the `rcodetools` gem for this to work.


### speeddating
Fix up C-a and C-x when dealing with dates. ([more](https://github.com/tpope/vim-speeddating))

### SplitJoin
Split and join code lines, such as Ruby ifs or CSS hashes ([more](https://github.com/AndrewRadev/splitjoin.vim))

Keys         | Function
-------------|-----------------------
  `,` `s`    | Split the current line
  `,` `S`    | Join the current lines

### SuperTab
Do all your insert-mode completion with Tab ([more](http://www.vim.org/scripts/script.php?script_id=1643))


### surround
Delete/change/add parentheses/quotes/XML-tags/much more with ease ([more](http://www.vim.org/scripts/script.php?script_id=1697))


### syntastic
Automatic syntax checking ([more](https://github.com/scrooloose/syntastic))


### Tabular
Configurable, flexible, intuitive text aligning ([more](http://github.com/godlygeek/tabular))

Keys             | Function
-----------------|--------------------
  `,` `a=`       | Align on =
  `,` `a=>`      | Align on =>
  `,` `a,`       | Align on ,
  `,` `a:`       | Align on :
  `,` `a{`       | Align on {
  `,` `a|`       | Align on |
  `,` `a<space>` | Align on spaces


### Tagbar
Sidebar for showing and navigating the tags in current file ([more](https://github.com/majutsushi/tagbar))

Keys      | Function
----------|-------------------
  `,` `]` | toggle the sidebar


### unimpaired
Pairs of handy bracket maps ([more](http://www.vim.org/scripts/script.php?script_id=1590))

### vim-abolish
Better abbreviations, substitution and search with Bash like {a,b} style expansions

### vim-airline
Powerline like behaviour, but without the heavy Python ([more](https://github.com/bling/vim-airline))

### vim-gitgutter
Show the changes made since the last commit in the gutter ([more](https://github.com/airblade/vim-gitgutter))

Keys       | Function
-----------|-----------------------------------
  `,` `g`  | Skip to the next changed chunk
  `,` `G`  | Skip to the previous changed chunk
  `,` `gt` | Toggle the git change gutter
  `,` `gh` | Highlight all changed lines


### vim-indent-guidelines
Show indent guidelines - very useful when editing Haml! ([more](https://github.com/nathanaelkane/vim-indent-guides))

Keys       | Function
-----------|------------------------------
  `,` `ig` | Toggle indentation guidelines


### vim-haml
Add haml, sass and SCSS syntax support ([more](https://github.com/tpope/vim-haml))


### vim-less
Less syntax highlighting ([more](https://github.com/groenewege/vim-less))


### vim-ruby
Ruby support (newer than the version released with vim). ([more](https://github.com/vim-ruby/vim-ruby))


### vim-ruby-refactoring
Refactoring tool for Ruby in vim! ([more](https://github.com/ecomba/vim-ruby-refactoring))

See [relish documentation](http://relishapp.com/despo/vim-ruby-refactoring) for examples.

### vim-textobj-rubyblock
Allow Ruby-aware text manipulation ([more](https://github.com/nelstrom/vim-textobj-rubyblock))

Keys        | Function
------------|----------------------------------------------------------------------------------
  `v``a``r` | Visually select the current Ruby scope, including the boundary lines
  `v``i``r` | Visually select the inside of the current Ruby scope (exludes the boundary lines)

When visually selecting something, the following can be used:

Keys        | Function
------------|----------------------------------------------------------------------------------
  `a``r`    | Extend the selection out one scope level
  `i``r`    | Contact the selection in one scope level


### vroom
A plugin for running your Ruby tests, specs, and features. ([more](http://www.vim.org/scripts/script.php?script_id=3995))

Keys      | Function
----------|--------------------------------------------------------------
  `,` `t` | Run current test/spec/feature, or previous if in another file
  `,` `T` | Run nearest test/spec/feature to the cursor


### ZoomWin
Zoom in/out of windows and panes (toggle between one window and multi-window) ([more](http://www.vim.org/scripts/script.php?script_id=508))

Keys      | Function
----------|---------
  `,` `z` | Zoom


## Other Keybindings
Keys             | Function
-----------------|-----------------------------------------------------
  `,` `,`        | Toggle between the previously opened buffer
  `ctrl-]`       | Jump to definition (needs exuberant ctags installed)
  `ctrl-n`       | Toggle between absolute and relative numbering
  `,` `h`        | Hide search highlighting
  `,` `H`        | Show/hide hidden characters
  `,` `rt`       | Run `ctags -R .`
  `,` `sp`       | Show/hide spelling errors
  `,` `sw`       | Strip trailing whitespace
  `,` `w`        | Toggle word wrapping
  `:Lorem`       | Generate 'lorem ipsum' text
  `:Hipster`     | Generate 'hipster ipsum' text

