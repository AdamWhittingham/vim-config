An awesome Vim config for development, slow roasted with a Ruby twist and a shot of web-dev.

# Installing
## For Neovim (recommended)
```bash
git clone --branch nvim https://github.com/AdamWhittingham/vim-config.git ~/.vim && ~/.vim/install
```
## For Vim
```bash
git clone https://github.com/AdamWhittingham/vim-config.git ~/.vim && ~/.vim/install
```

Should this not leave you with a nice working vim (certain Vims are a bit iffy about the last line) then launch vim and run `:PlugUpdate`

If you are using zsh there may be an issue running tests with ,t (it can't find the bundle). If you don't already have an /etc/zprofile file it can be fixed by doing the following:

```bash
sudo mv /etc/zshenv /etc/zprofile
```
more details here: http://vim.1045645.n5.nabble.com/MacVim-and-PATH-td3388705.html#a3392363

## External Dependencies
There are a couple of things you need to install to get the best out of this config:
* ctags - enables tags support when working with code
* Ag - enables grepping through the current directories with [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* NodeJS - enables integration for JS tools listed here

# Updating
```bash
cd ~/.vim
git pull
```

* If you've installed the auto-update hook, the git pull should trigger Vim to update and you're done!
* Manually update by opening Vim and running `:PlugClean` and `:PlugUpdate`.

# Personalisation
We all like things a little differently, so there are a couple of ways to easily tweak and add to the config.

## Add more plugins
Simply write normal plugin lines to `~/.vim.plugins.local`.
For example:
```
Plug 'AdamWhittingham/projector_mode'
```

## Set up, override or extend config
Changes like using a different font or colour scheme can be made by writing Vim config into `~/.vimrc.local`

## Powerline

This config comes ready to use either with or without a Powerline patched font. As detecting the powerline characters is pretty much impossible, you can enable this by setting `POWERLINE=1` in your shell (ie. in `~/.bashrc` or `~/.zshrc`).
Note that this is *off* by default.


# Using the config

There is no replacement for having a look through the config and seeing which plugins are installed and which key bindings are set. However, that can be a bit daunting, so here are the highlights!

The defeault `<leader>` key is Space.

## Opening files

| Key                        | Function                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `<leader> f`               | Open a fuzzy finder, allowing you to search for a file                                  |
| `<leader> .`               | Show the currently open files so you can switch between them                            |
| `<leader><leader>`         | Switch back to the previously open file                                                 |
| `:A`                       | Toggle between a file and it's 'alternative' (ie. lib file and its unit test file)      |
| `<leader>` `m`             | See the project file system


## Editing & Formatting

| Key                   | Function                                                                                                          |
| --------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `<leader> i`          | Format the current file. This may use external tools if configured.                                               |
| `ctrl-f`              | Format the current file or section via coc.nvim                                                                   |
| `gcc` or `gc<motion>` | Comment/Uncomment this line                                                                                       |
| `<leader> s`          | Split the current text based on the context                                                                       |
| `<leader> S`          | Join the current text based on the context                                                                        |
| `gs`                  | Go Switch! (Flips text based on context; ie. true to false)                                                       |
| `cs<a><b>`            | Change surround <a> for <b> (ie. `cs("` will change round brackets for double quotes)                             |
| V `<leader> a`        | Begin interative aligning mode for more sophisticated alignment from the easy-align plugin                        |
| `<leader> p`          | Swap the last paste for the next item in the yank stack                                                           |
| `<leader> P`          | Swap the last paste for the previous item in the yank stack                                                       |


## Versioning

| Key                   | Function                                                                                                          |
| --------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `u`                   | Undo the previous change                                                                                          |
| `U`                   | Redo (easier than C-r but replaces default 'undo last line')                                                      |
| `<leader> u`          | Show the undo tree, a super powerful way of undoing changes when you've already undone and changed something else |
| `<leader> gn`         | Skip to the next changed chunk                                                                                    |
| `<leader> gP`         | Skip to the previous changed chunk                                                                                |
| `<leader> gt`         | Toggle the git change gutter                                                                                      |
| `<leader> gh`         | Highlight all changed lines                                                                                       |
| `<leader> ga`         | Add this hunk to the stage for the next commit                                                                    |
| `<leader> gu`         | Undo this hunk (revert it to whatever is in git)                                                                  |
| `<leader> gd`         | Show the diff of the hunk under the cursor                                                                        |


## Finding things

| Key                   | Function                                                                                                          |
| --------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `ctrl-]`              | Jump to the definition of the tag under the cursor                                                                |
| `<leader> ]`          | Show all references to the tag under the cursor                                                                   |
| `<leader> {`          | Find all references to the tag under the cursor in the current file                                               |
| `<leader> }`          | Find all references to the tag under the cursor                                                                   |
| `*`                   | Search for the word under the cursor in all files                                                                 |
| `<leader> h`          | Hide search highlighting                                                                                          |
| `<leader> H`          | Show/hide hidden characters                                                                                       |
| `<leader> sp`         | Show/hide spelling errors                                                                                         |
| `<leader> sw`         | Strip trailing whitespace                                                                                         |
| `<leader> $`          | Toggle line wrapping                                                                                              |
| `ctrl-n`              | Toggle between absolute and relative numbering                                                                    |


## Autocomplete and snippets

| Key            | Function                                                 |
| -------------- | -------------------------------------------------------- |
| `<tab>`        | Scroll through the autocomplete menu once it appears     |
| `<Ctrl>x`      | If you have selected a snippet , expand it               |
| `<tab>`        | Move to the next part of the snippet which can be edited |
| `<leader> r`   | Rename the token under the cursor across the project |


## Window/Pane controls

| Keys          | Function                              |
| ------------- | ------------------------------------- |
| `<leader> ws` | Split the current window vertically   |
| `<leader> wS` | Split the current window horizontally |
| `<leader> ww` | Jump into the next split              |
| `<leader> z`  | Zoom (full-window) the current split  |
| `ctrl` `h`    | Move to the next split to the left    |
| `ctrl` `j`    | Move to the next split to down        |
| `ctrl` `k`    | Move to the next split to up          |
| `ctrl` `l`    | Move to the next split to the right   |


## Testing

| Keys          | Function                                                         |
| ------------- | ---------------------------------------------------------------- |
| `<leader> t`  | Run current test/spec/feature, or previous if in another file    |
| `<leader> T`  | Run nearest test/spec/feature to the cursor                      |
| `<leader> rt` | Run `ctags -R .` to make things like jumping to definitions work |

## Current file tools

| Key | Function |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `<leader> cr`              | Copy the files relative path and line number                                            |
| `<leader> cp`              | Copy the files relative path                                                            |
| `<leader> cP`              | Copy the files absolute path                                                            |
| `<leader> cd`              | Copy the files directory path                                                           |
| `<leader> cf`              | Copy the files basename                                                                 |

