-- Lazy.nvim Plugin Manager Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
  -- LaTex Plugin
  { "lervag/vimtex" },

  -- Auto-completion
  { "neoclide/coc.nvim", branch = "release" },

  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Fuzzy Finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Status line
  { "nvim-lualine/lualine.nvim" },

  -- Color scheme
  { "morhetz/gruvbox" }
})

-- Enable syntax highlighting
vim.cmd("syntax enable")
vim.cmd("colorscheme gruvbox")

-- Lualine setup
require("lualine").setup()

-- Treesitter setup
require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "cpp" },
  highlight = { enable = true }
}

-- Configure vimtex
vim.g.vimtex_view_method = "skim" -- Or use "zathura", "sioyek" based on your PDF viewer
vim.g.vimtex_compiler_method = "latexmk"
