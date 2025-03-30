local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "ts_ls", "clangd", "pyright", "gopls", "bacon_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

