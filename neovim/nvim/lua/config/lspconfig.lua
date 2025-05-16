local lspconfig = require("lspconfig")

local on_attach = function(client)
    require('completion').on_attach(client)
end

local servers = { "html", "cssls", "denols", "clangd", "pyright", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

-- require("lspconfig").rust_analyzer.setup({
--     on_attach = on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             imports = {
--                 granularity = {
--                     group = "module",
--                 },
--                 prefix = "self",
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })

require("lspconfig").bacon_ls.setup({
    init_options = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
        updateOnChange = true,
        validateBaconPreferences = true,
        runBaconInBackground = true,
    }
})
