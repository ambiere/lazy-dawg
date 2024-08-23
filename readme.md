# lazy-dawg

>Custom script that runs lazygit from within neovim

## why

LazyVim has a builtin lazygit util, that open a floating
terminal when lazygit is launched within neovim. This approach
uses tmux-session and tmux-window features instead to run lazygit.

```lua
local map = vim.keymap.set

map("n", "<leader>gG", "<cmd>silent !lazy-dawg<CR>", { desc = 'Open lazygit (cwd)'})
```

Prerequisites: [tmux](https://github.com/tmux/tmux/wiki) and [lazygit](https://github.com/jesseduffield/lazygit)


## Usage

Clone the repo, make the script executable and point `$PATH` to the script.
In neovim, map your preferred keys to silently execute the script.
