-- local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
-- api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = "\\"
g.maplocalleader = "\\"

vim.opt.termguicolors  = true -- Enable colors in terminal
vim.opt.hlsearch       = true --Set highlight on search
vim.opt.number         = true --Make line numbers default
vim.opt.relativenumber = true --Make relative number default
vim.opt.mouse          = "a" --Enable mouse mode
vim.opt.breakindent    = true --Enable break indent
vim.opt.undofile       = true --Save undo history
vim.opt.ignorecase     = true --Case insensitive searching unless /C or capital in search
vim.opt.smartcase      = true -- Smart case
vim.opt.updatetime     = 250 --Decrease update time
vim.opt.signcolumn     = "yes" -- Always show sign column
vim.opt.clipboard      = "unnamedplus" -- Access system clipboard
vim.opt.timeoutlen     = 500 --	Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.showmode       = false -- Do not need to show the mode. We use the statusline instead.

vim.diagnostic.config {
  float = { border = "rounded" },
}

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"
vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

-- Better Netrw, alternatively just use vinegar.vim
-- g.netrw_banner = 0 -- Hide banner
-- g.netrw_browse_split = 4 -- Open in previous window
-- g.netrw_altv = 1 -- Open with right splitting
-- g.netrw_liststyle = 3 -- Tree-style view
-- g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

-- Treesitter based folding
vim.cmd [[
  set foldlevel=20
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]]
