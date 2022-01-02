Ad's Neovim Config
==================

# Installation

```bash
git clone -b neovim-rebuild https://github.com/AdamWhittingham/vim-config.git ~/.config/nvim
```

# Optional external dependencies
There's a couple of tools that make this config really work well:

1. Running in [Kitty](https://sw.kovidgoyal.net/kitty/) with a [NerdFont](https://www.nerdfonts.com/) because we deserve pretty things in the terminal.
2. [Ripgrep](https://github.com/BurntSushi/ripgrep) makes a lot of searches so much faster

# Key Mappings

For the canonical list, see [keymaps.lua](./lua/config/keymaps.lua)

The `<leader>` key is **Space**

## File & buffer navigation

| Key                        | Function                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `<leader> .`               | Show the currently open buffers so you can switch between them                          |
| `<leader><leader>`         | Switch back to the previously open file                                                 |
| `<leader> f`               | Find by **file name**                                                                   |
| `<leader> F`               | Search for text in all files                                                            |
| `<leader>` `d`             | View the directory tree                                                                 |
| `:A`                       | Toggle between a file and it's 'alternative' (ie. lib file and its unit test file)      |


## Window navigation

| Key                        | Function                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `<Control> h/j/k/l`        | Move cursor to the pane left/up/down/right                                              |
| `<Control>ws`              | Split the current view vertically                                                       |
| `<Control>wS`              | Split the current view horizontally                                                     |
| `:AV`                      | Open the files 'alternative' in a vertical split                                        |


## Version control

| Key                        | Function                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `ca`                       | Add a change to the next commit                                                         |
| `cA`                       | Add all changes to this file to the next commit                                         |
| `cr`                       | Reset a change                                                                          |
| `]c`                       | Move to the next change                                                                 |
| `[c`                       | Move to the previous change                                                             |


## Development

| Key                        | Function                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------- |
| `<leader>t`                | Run the current tests                                                                   |
| `<leader>cr`               | Copy the relative path of the current file and line                                     |
| `<leader>cp`               | Copy the relative path of the current file                                              |
| `<leader>{`                | Jump to the definition of the function/class/method under the cursor                    |
| `<leader>}`                | Search for references to the function/class/method under the cursor                     |
