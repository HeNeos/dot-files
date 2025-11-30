vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
end

local servers = { "html", "cssls", "denols", "gopls" }

for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {on_attach = on_attach,}
end

vim.lsp.enable("clangd")
vim.lsp.config.clangd = {
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  }
}

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

vim.lsp.config("bacon_ls", {
     init_options = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
        updateOnChange = true,
        validateBaconPreferences = true,
        runBaconInBackground = true,
    }
})

-- require("lspconfig").bacon_ls.setup({
--     init_options = {
--         updateOnSave = true,
--         updateOnSaveWaitMillis = 1000,
--         updateOnChange = true,
--         validateBaconPreferences = true,
--         runBaconInBackground = true,
--     }
-- })

vim.lsp.enable("ruff")
-- vim.lsp.config('ruff', {
--   init_options = {
--     settings = {
--       -- Ruff language server settings go here
--     }
--   }
-- })

vim.lsp.enable("basedpyright")
vim.lsp.config.basedpyright = {
  root_dir = vim.fs.root(0, {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  }),
  on_attach = on_attach,
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
}


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

-- lspconfig.basedpyright.setup({
--     root_dir = lspconfig.util.root_pattern(
--         "pyproject.toml",
--         "setup.py",
--         "setup.cfg",
--         "requirements.txt",
--         "Pipfile",
--         ".git"
--     ),
--     settings = {
--         basedpyright = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "openFilesOnly",
--                 useLibraryCodeForTypes = true,
--             },
--         },
--         pyright = {
--             disableOrganizeImports = true,
--         },
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--             },
--         },
--     },
-- })

for name, _ in pairs(vim.lsp.config) do
  vim.lsp.enable(name)
end
