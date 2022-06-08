Ad's Neovim Config
==================

A potent Neovim config, enhanced with rich flavours of software development and notable hints of Ruby, JS and Go.

![screenshot](screenshot.png)

# Installation

```bash
git clone -b nvim https://github.com/AdamWhittingham/vim-config.git ~/.config/nvim
```

### Still using Vim?
If you haven't moved to Neovim, I've left the `master` branch in-tact with the now unmaintained Vim-centric config on to avoid breaking anything.
But seriously, consider switching to Neovim and trying the new stuff out, it's fantastic!

# Optional external dependencies
There's a couple of tools that make this config really work well:

1. Running in [Kitty](https://sw.kovidgoyal.net/kitty/) with a [NerdFont](https://www.nerdfonts.com/) because we deserve pretty things in the terminal.
2. [Ripgrep](https://github.com/BurntSushi/ripgrep) makes a lot of searches **much** faster
3. [fd](https://github.com/sharkdp/fd) Similarly, `fd` is a replacement to find which makes file listing much faster

# First Time Setup
Neovim is incredibly powerful but can do even more when it has some awareness of the languages you are editing.
To provide Neovim with this context, we need to install some Language Servers. Thankfully this can all be done for us:

- Install a language servers the language of the file you have open with `:LspInstall`
- View and choose from a list by running `:LspInstallInfo`, and pressing `i` on Language Servers you want

# Key Mappings
For the canonical list, see [keymaps.lua](./lua/config/keymaps.lua)
You can also type `:WhichKey` for a helpful list, or pausing in the middle of a sequence will show you the options to complete it.

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


# Goals and Guides

This project has two goals:
1. Empower me to get more done in my daily work as an engineer.
2. Be easy to started with, so when someone I work with wants to learn Vim, they can use this as a starting point until they are ready to build their own config.

It's easy to get carried away with every plugin, keybind and option that you see online, so I use the following guiding principles:

1. Plugins aren't evil. I respect people who go the full vim-minimalism route and only use it as it comes out of the box, but it is a tool for a purpose. Anything that give me more context and lets me focus more on the work at hand is a good thing.
2. Too many plugins are evil. If installation becomes complex, or performance takes a dive, things need to go. Everything has a cost and needs to earn it's keep.
3. Additional key mappings should be consistent and ideally use a mnemonic. For example, `c` is used for git hunks using the mnemonic "Change" (e.g. add changes, reset changes).
