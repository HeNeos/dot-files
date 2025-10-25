local lspconfig = require("lspconfig")

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

local on_attach = function(client)
    require('completion').on_attach(client)
end

local servers = { "html", "cssls", "denols", "clangd", "gopls", "pyright" }

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

-- vim.lsp.config('ruff', {
--   init_options = {
--     settings = {
--       -- Ruff language server settings go here
--     }
--   }
-- })

vim.lsp.enable('ruff')


-- vim.lsp.config("basedpyright", {
--   root_dir = root_pattern,
--   settings = {
--     pyright = {
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         -- ignore = { '*' },
--       },
--     },
--   },
-- })

lspconfig.basedpyright.setup({
    root_dir = lspconfig.util.root_pattern(
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git"
    ),
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
