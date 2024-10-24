# My personal Neovim config

This repository contains my personal neovim config, written from scratch. I
learned a lot from the [Awesome Neovim
Configuration](https://github.com/Ultra-Code/awesome-neovim), along with other
sources from all over the internet.

The most important plugins that are used in this config and on which I am
relying every day are:
- Telescope
- Treesitter
- LSP config (+ Mason and friends)

A lot of the other plugins are nice to have. Some should probably by pruned, as
they are not used anymore or could be replaced easily.

This config is working with a self compiled built of neovim
`v0.11.0-dev-1013+gc8e47f648`.

## Install

You should probably not just use this setup, but pick the parts that you like
for your own config. Also, writing a neovim config from scratch is not hard and
a great leearning experience - plus fun!

If you still insist, here you go:

```bash
mv ~/.config/nvim ~/.config/nvim-backup
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

git clone https://github.com/tkreuziger/neovim-config.git ~/.config/nvim
```

When you start up neovim the first time, lazy will install all the things that
you need. You probably have to restart one more time, so Mason is doing the
same, as well as Treesitter.
