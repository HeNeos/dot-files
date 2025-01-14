local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

opt.list = true
opt.listchars = {space = "·", tab = "▷▷⋮"}



vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function ()
    vim.lsp.buf.format({async = false})
  end,
})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.cpp",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !clang-format -i %")
            vim.cmd("edit")
        end,
    }
)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function ()
    vim.lsp.buf.format({async = false})
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  group = "AutoFormat",
  callback = function ()
    vim.cmd("silent write")
    vim.cmd("silent !rustfmt --quiet %")
    vim.cmd("edit")
  end,
})
