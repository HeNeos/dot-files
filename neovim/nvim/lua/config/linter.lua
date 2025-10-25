require('lint').linters_by_ft = {
  markdown = {'vale'},
  rust = {'clippy'},
  python = {'flake8', 'mypy'},
  go = {'golangcilint'},
  typescript = {'deno'},
  javascript = {'deno'},
}

mypy = require('lint').get_namespace("mypy")
-- flake8 = require('lint').get_namespace("flake8")
