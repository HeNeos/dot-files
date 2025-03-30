vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.showmatch = true
vim.opt.foldmethod = 'marker'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.listchars = {space = "·", tab = "▷▷⋮"}
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.whichwrap:append "<>[]hl"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map('n', '<C-H>', '<C-W>h', opts)
map('n', '<C-J>', '<C-W>j', opts)
map('n', '<C-K>', '<C-W>k', opts)
map('n', '<C-L>', '<C-W>l', opts)
map('n', '<A-,>', '<Cmd>:vsplit<CR>', opts)
map('n', '<A-.>', '<Cmd>:split<CR>', opts)

-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

map('n', '<C-n>', '<Cmd>Neotree toggle reveal<CR>', opts)
map('n', '<C-m>', '<Cmd>AerialToggle<CR>', opts)

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function ()
    vim.lsp.buf.format({async = false})
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = "*.cpp",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !clang-format -i %")
            vim.cmd("edit")
        end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.py",
  group = "AutoFormat",
  callback = function()
    require("lint").try_lint("mypy")
    require("lint").try_lint("flake8")
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.go",
  callback = function ()
    rquire("lint").try_lint("golangcilint")
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.rs",
  callback = function ()
    rquire("lint").try_lint("clippy")
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.ts",
  callback = function ()
    rquire("lint").try_lint("deno")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function ()
    vim.lsp.buf.format({async = false})
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function ()
    vim.cmd("silent write")
    vim.cmd("silent !black %")
    vim.cmd("edit")
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

vim.diagnostic.config({virtual_text = true})

require("config.lazy")
