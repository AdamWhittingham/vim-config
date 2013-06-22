This is a tweaked copy of the excellent Vi/Vim dev setup [Kerryb](https://github.com/kerryb/vim-config)

# Installation

### Backup
If necessary, backup and remove your <tt>~/.vim</tt> directory and <tt>~/.vimrc</tt> file:

    mv $HOME/.vim{,.original-$(date +%Y.%m.%d-%H.%M.%S)}
    mv $HOME/.vimrc{,.original-$(date +%Y.%m.%d-%H.%M.%S)}

### Download
Clone this repository to <tt>~/.vim</tt>:

    git clone git://github.com/AdamWhittingham/vim-config.git ~/.vim

(If you're behind a firewall that blocks port 9418, replace <tt>git:</tt> with
<tt>https:</tt> in the above URL.)

Alternatively, if for some bizarre reason you don't have git installed, you can
download a zip or tar file using the link on
[GitHub](http://github.com/AdamWhittingham/vim-config).

### Symlink
Finally, symlink <tt>.vimrc</tt> so the config is loaded when Vim starts:

    ln -s ~/.vim/vimrc ~/.vimrc

## Keeping up-to-date

    cd ~/.vim
    git pull

## Local Customisation

Local changes (eg if you prefer a different font or colour scheme) can either
be made in a branch, or in <tt>~/.vimrc.local</tt>.

# Included Plugins

See the plugins' web pages for more information. The keybindings listed are mostly
just those defined or overridden locally, not the ones provided by default.

Plugins are installed in their own directories under <tt>bundle</tt>, thanks to
[Pathogen](http://www.vim.org/scripts/script.php?script_id=2332).

## Ack (0.3.1)

This plugin is a front for the Perl module App::Ack. Ack can be used as a replacement for 99% of the uses of grep.
(more)[http://www.vim.org/scripts/script.php?script_id=2572]

Requires ack (aka ack-grep) to be installed.

## Align (35/41)

Help folks to align text, eqns, declarations, tables, etc ([more](http://www.vim.org/scripts/script.php?script_id=294))

*Keybindings*

## bufexplorer (7.2.8)

Buffer explorer/browser ([more](http://www.vim.org/scripts/script.php?script_id=42))

*Keybindings*

<dl>
  <dt>,.</dt><dd>Show buffer explorer</dd>
</dl>

## Coffeescript (fd170cb - 13 June 2011)

Adds support for CoffeeScript. It handles syntax, indenting, and compiling ([more](http://www.vim.org/scripts/script.php?script_id=3590))

## Colorizer (3e4cbb4d93 - 14 Dec 2012)

Adds the ability to highlight hex colours in their own colour ([more](https://github.com/chrisbra/color_highlight))

*Keybindings*

<dl>
  <dt>,cC</dt><dd>Toggle colour highlighting</dd>
  <dt>,cF</dt><dd>Toggle text or background colouring</dd>
</dl>

## CtrlP

Fast file navigation for VIM ([more](https://github.com/kien/ctrlp.vim))

*Keybindings*

<dl>
  <dt>C-p</dt><dd>Open the CtrlP fuzzy search</dd>
  <dt>,t</dt><dd>Refresh the cache and open the CtrlP fuzzy search</dd>
</dl>

## Gundo (2.2.2)

Gundo is a Vim plugin for visualizing your undo tree to make it usable ([more](http://www.vim.org/scripts/script.php?script_id=3304))

*Keybindings*

<dl>
  <dt>,u</dt><dd>Toggle Gundo tree</dd>
</dl>

## HTML5

Adds support for HTML 5 keyword highlightings ([more](https://gist.github.com/256840))

## markdown

Syntax highlighting for Markdown ([more](http://plasticboy.com/markdown-vim-mode/))

## machit

Allows % to be changed to match more than single characters; often more up-to-date than the version which ships with Vim. ([more](http://www.vim.org/scripts/script.php?script_id=39))

## nerdcommenter (2.3.0)

A plugin that allows for easy commenting of code for many filetypes ([more](http://www.vim.org/scripts/script.php?script_id=1218))

## nerdtree (4.2.0)

A tree explorer plugin for navigating the filesystem ([more](http://www.vim.org/scripts/script.php?script_id=1658))

*Keybindings*

<dl>
  <dt>,m</dt><dd>Show/hide NERDTree</dd>
  <dt>,f</dt><dd>Show current file in tree</dd>
  <dt>C</dt><dd>Set the current folder to be the root of the tree</dd>
  <dt>p</dt><dd>Go to parent of selected item</dd>
  <dt>?</dt><dd>Toggle the help list</dd>
</dl>

## projector mode (55e7a8d69a)

Toggle 'projector mode': larger font and high contrast colour scheme ([more](https://github.com/AdamWhittingham/projector_mode))
<dl>
  <dt>,p</dt><dd>Toggle 'projector mode' (large font, high contrast)</dd>
</dl>

## ragtag (2.0)

A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more ([more](http://www.vim.org/scripts/script.php?script_id=1896))

If you have already typed 'foo', the following shortcuts apply (with the cursor position marked by ^):

<dl>
  <dt>&lt;C-X&gt;=</dt><dd>foo&lt;%= ^ %&gt;</dd>
  <dt>&lt;C-X&gt;+</dt><dd>&lt;%= foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;-</dt><dd>foo&lt;% ^ %&gt;</dd>
  <dt>&lt;C-X&gt;_</dt><dd>&lt;% foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;'</dt><dd>foo&lt;%# ^ %&gt;</dd>
  <dt>&lt;C-X&gt;"</dt><dd>&lt;%# foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;&lt;Space&gt;</dt><dd>&lt;foo&gt;^&lt;/foo&gt;</dd>
  <dt>&lt;C-X&gt;&lt;CR&gt;</dt><dd>&lt;foo&gt;<br />^<br />&lt;/foo&gt;</dd>
  <dt>&lt;C-X&gt;/</dt><dd>Last HTML tag closed</dd>
  <dt>&lt;C-X&gt;!</dt><dd>&lt;!DOCTYPE...&gt;/&lt;?xml ...?&gt; (menu)</dd>
  <dt>&lt;C-X&gt;@</dt><dd>&lt;link rel="stylesheet" ...&gt;</dd>
  <dt>&lt;C-X&gt;#</dt><dd>&lt;meta http-equiv="Content-Type" ... /&gt; <em>ragtag-CTRL-X_#</em></dd>
  <dt>&lt;C-X&gt;$</dt><dd>&lt;script src="/javascripts/^.js"&gt;&lt;/script&gt; <em>ragtag-CTRL-X_$</em></dd>
</dl>

## rails (4.3)

Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more ([more](http://www.vim.org/scripts/script.php?script_id=1567))

*Keybindings*

<dl>
  <dt>,r</dt><dd>run rake</dd>
</dl>

## rake (1.0)

It's like rails.vim without the rails ([more](http://www.vim.org/scripts/script.php?script_id=3669))

## repeat (1.0)

Use the repeat command (.) with supported plugins ([more](http://www.vim.org/scripts/script.php?script_id=2136))

## SuperTab (1.6)

Do all your insert-mode completion with Tab ([more](http://www.vim.org/scripts/script.php?script_id=1643))

## surround (1.90)

Delete/change/add parentheses/quotes/XML-tags/much more with ease ([more](http://www.vim.org/scripts/script.php?script_id=1697))

## switch (93759a6b)

Switch between predefined code blocks (eg. Ruby 1.8 to 1.9 hash syntax) ([more](https://github.com/AndrewRadev/switch.vim))

## syntastic (7f0412e9)

Automatic syntax checking ([more](https://github.com/scrooloose/syntastic))

## Tabular (b7b4d87 - 31 Mar 2011)

Configurable, flexible, intuitive text aligning ([more](http://github.com/godlygeek/tabular/blob/master/doc/Tabular.txt))

*Keybindings*

<dl>
  <dt>,tt</dt><dd>(when text is selected) format tables made with pipes (|)</dd>
</dl>

## Tagbar (cc222f5d8c - 26 Feb 2013)

Sidebar for showing and navigating the tags in current file ([more](https://github.com/majutsushi/tagbar))

*Keybindings*

<dl>
  <dt>,]</dt><dd>toggle the sidebar</dd>
</dl>

## unimpaired (1.1)

Pairs of handy bracket maps ([more](http://www.vim.org/scripts/script.php?script_id=1590))

## vim-abolish (d64ce06650, 30 Apr 2013)

Better abbreviations, substitution and search with Bash like {a,b} style expansions

## vim-bundler (3f1e6e9f, 22 Aug 2011)

Lightweight bag Vim goodies for Bundler ([more](https://github.com/tpope/vim-bundler))

## vim-colors-solarized

The well-known solarized colorscheme ([more](https://github.com/altercation/solarized))

## vim-dispatch (b171bbc64a18dd565ff4d354d340ee5f0bbd4ac1 - 28 April 2013)

Run tests with neat integration for tmux or the shell ([more](https://github.com/tpope/vim-dispatch.git))

<dl>
  <dt>,,</dt><dd>Run current rspec file</dd>
</dl>

## vim-easytags (7916b46 - 3 June 2013)

Automatically update ctags in the background ([more](https://github.com/xolox/vim-easytags))

## vim-gitgutter (ff031d022f - 27 May 2013)

Show the changes made since the last commit in the gutter ([more](https://github.com/airblade/vim-gitgutter))

<dl>
  <dt>,g</dt><dd>Skip to the next changed chunk</dd>
  <dt>,G</dt><dd>Skip to the previous changed chunk</dd>
  <dt>,gt</dt><dd>Toggle the git change gutter</dd>
  <dt>,gh</dt><dd>Highlight all changed lines</dd>
</dl>

## vim-haml (3327947 - 3 June 2013)

Add haml, sass and SCSS syntax support ([more](https://github.com/tpope/vim-haml))

## vim-less (8443f89 - 3 June 2013)

Less syntax highlighting ([more](https://github.com/groenewege/vim-less))

## vim-powerline (09c0cea859a2e0989eea740655b35976d951a84e - Nov 2012)

Colourful and neat status bar without the need for font patching

## vim-ruby (b10adca - 17 Aug 2012)

Ruby support (newer than the version released with vim). ([more](https://github.com/vim-ruby/vim-ruby))

## vim-ruby-refactoring (6447a4d - 28 Dec 2011)

Refactoring tool for Ruby in vim! ([more](https://github.com/ecomba/vim-ruby-refactoring))

See [relish documentation](http://relishapp.com/despo/vim-ruby-refactoring) for examples.

## ZoomWin (23)

Zoom in/out  of windows (toggle between one window and multi-window) ([more](http://www.vim.org/scripts/script.php?script_id=508))

*Keybindings*

<dl>
  <dt>,z</dt><dd>Zoom</dd>
</dl>

# Other Keybindings

<dl>
  <dt>++</dt><dd>Increment the number under the cursor</dd>
  <dt>--<dt><dd>Decrement the number under the cursor</dd>
  <dt>alt-c</dt><dd>In visual modes, copy the selected to the system clipboard</dd>
  <dt>alt-v</dt><dd>Paste from the system clipboard</dd>
  <dt>ctrl-]</dt><dd>Jump to definition (needs exuberant ctags installed - see Tags section below)</dd>
  <dt>ctrl-n</dt><dd>Toggle between absolute and relative numbering</dd>
  <dt>,c</dt><dd>Show/hide hidden characters</dd>
  <dt>,h</dt><dd>Hide search highlighting</dd>
  <dt>,rr</dt><dd>Run ruby file</dd>
  <dt>,rt</dt><dd>Run run_tags script (assuming it's installed and in the path)</dd>
  <dt>,s</dt><dd>Show/hide spelling errors</dd>
  <dt>,sw</dt><dd>Strip trailing whitespace</dd>
  <dt>,tsp</dt><dd>Align on whitespace</dd>
  <dt>,t&gt;</dt><dd>Align on =></dd>
  <dt>,tlt</dt><dd>Align LaTEX tables (to avoid clashing with our existing ,tt mapping)</dd>
  <dt>,t{</dt><dd>Align on '{' characters (useful for let blocks)</dd>
  <dt>,t></dt><dd>Align on '>' characters (useful for hashes)</dd>
  <dt>,w</dt><dd>Toggle word wrapping</dd>
  <dt>RB</dt><dd>Open Ruby docs in browser for word under cursor</dd>
  <dt>RR</dt><dd>Open Rails docs in browser for word under cursor</dd>
</dl>

# Tags

The ctrl-] and ,rt shortcuts need both [exuberant ctags](http://blog.tobiascrawley.net/2009/01/01/generating-a-tags-file-from-a-git-hook/),
and the run_tags script installed.

The run_tags scripts are available for ubuntu ([script](https://gist.github.com/186567)/[raw](https://raw.github.com/gist/186567/d26a00ef99f4132a8bb5a58e981d93f4663f4ca8/run_tags.rb)) and  OS X ([script](https://gist.github.com/1564787)/[raw](https://raw.github.com/gist/1564787/484c239f55fe33d301e11fd29dff05221b6e2a04/run_tags.rb))

# Commands

<dl>
  <dt>:Lorem</dt><dd>Generate 'lorem ipsum' text</dd>
</dl>
