# Astro v3 fork

## 🗒️ Links

[Astro v3 docs](https://docs.astronvim.com/v3)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/v3/Recipes/icons)) <sup>[[1]](#1)</sup>
- [Neovim 0.8+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (_Note:_ This is only necessary if you want to use `auto_install` feature with Treesitter)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using) <sup>[[2]](#2)</sup>
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)
- [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)

> <sup id="1">[1]</sup> All downloadable Nerd Fonts contain icons which are used by AstroNvim. Install the Nerd Font of your choice to your system and in your terminal emulator settings, set its font face to that Nerd Font. If you are using AstroNvim on a remote system via SSH, you do not need to install the font on the remote system.

> <sup id="2">[2]</sup> Note when using default theme: For MacOS, the default terminal does not have true color support. You will need to use [iTerm2](https://iterm2.com/), [Kitty](https://sw.kovidgoyal.net/kitty/), [WezTerm](https://wezfurlong.org/wezterm/), or another [terminal emulator](https://gist.github.com/XVilka/8346728#terminal-emulators) that has true color support.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/lamsyl/AstroNvim ~/.config/nvim
```

Create user config `~/.config/astronvim/lua/user/init.lua` if not present yet

Then make a symlink to the user config

```shell
cd ~/.config/nvim/lua/user
ln -s ~/.config/astronvim/lua/user/init.lua init.lua
```

#### Clone the repository as a stable config

Useful for editing config using a stable nvim

```shell
git clone https://github.com/lamsyl/AstroNvim ~/.config/astro-stable
```

Copy the user config

```shell
cp ~/.config/nvim/lua/user/init.lua ~/.config/astro-stable/lua/user/init.lua
```

#### Initial setup

Perform initial setup for both nvim and stable nvim

1. `nvim` or `NVIM_APPNAME=astro-stable nvim`
2. `:Lazy`
3. Sync
4. `:Mason`
5. Install mason packages
6. `:TSInstall {lang}` or `:TSInstall all`

Track these files in dotfiles repo

- `~/.config/astronvim/lua/user/init.lua`
- `~/.local/share/nvim/lazy-lock.json`

## ⚙️ Config

Make change directly in `~/.config/nvim` (checkout `astrofork`)

Use `lua/user/init.lua` for machine-specific user config

###### main config

`~/.config/nvim`

###### user config

`~/.config/nvim/lua/user/init.lua`, symlink to `~/.config/astronvim/lua/user/init.lua`

astrofork repo ignores user config, use dotfiles repo to track `~/.config/astronvim/lua/user/init.lua`

###### plugin lockfile

`~/.local/share/nvim/lazy-lock.json`

use dotfiles repo to track [lockfile](https://lazy.folke.io/usage/lockfile)

#### Edit config using a stable nvim

`~/.config/nvim` contains experimental main config

`~/.config/nvim/lua/user/init.lua` contains experimental user config

To edit config using a stable nvim

```shell
cd ~/.config/nvim
NVIM_APPNAME=astro-stable nvim lua/user/init.lua
```

Once the experimental config becomes stable,

1. Push the experimental main config change to astrofork
2. Pull the change in `~/.config/astro-stable`
3. Use dotfiles repo to track `~/.config/astronvim/lua/user/init.lua`
4. Copy (not symlink) user config to stable user config:

```shell
cp ~/.config/nvim/lua/user/init.lua ~/.config/astro-stable/lua/user/init.lua
```

#### Update plugins

1. `nvim`
2. `:Lazy`
3. Sync, or update individual plugin

If stable,

1. Use dotfiles repo to track `~/.local/share/nvim/lazy-lock.json`
2. Copy lockfile to stable nvim

```shell
cp ~/.local/share/nvim/lazy-lock.json ~/.local/share/astro-stable/lazy-lock.json
```

3. Update stable nvim plugins

```shell
NVIM_APPNAME=astro-stable nvim -c 'lua require("lazy").restore()'
```

If broken, rollback

1. Revert `~/.local/share/nvim/lazy-lock.json`
2. `nvim`
3. `:Lazy`
4. Restore
