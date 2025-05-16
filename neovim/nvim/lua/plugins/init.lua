local plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",
      }
    }
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  'f-person/git-blame.nvim',
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "bash",
        "json",
        "yaml",
        "toml",
        "rust",
        "go",
        "cpp",
        "terraform",
        "dockerfile"
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    }
  },
  {
  "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  "nvim-lua/plenary.nvim",
  "onsails/lspkind.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  
  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
},
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  
  {
    "romgrk/barbar.nvim",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = "^1.0.0"
  },
  
  "folke/neodev.nvim",
  
  "folke/which-key.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "nvim-telescope/telescope.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    },
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = "hyper",
        hide = {
          statusline,
          tabline,
          winbar
        },
        config = {
          header = {
"e7eeeeeete3eeeee37**7teeeeeeee3773eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee3eeeet;'..;73e3e333333333333t33t3t3t3tt3ttttttt777777*****;*;;;;;;;;';';''''''''.''..' ;@OONONOONONONONON ",
"tteeeeee7eteeeeeeeeeet*;;*3eeeeee3tt3eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee3eeeeeee3eeee37*;';*33ee333333333333t33t33tt3tt3tttt3tt7ttt7t7t777****;;*;;;;;;;';;''''''''''.'..'..ONOONOONONOONONOO",
"eeeeee3t37eeeeeeeeeeeeee77;'**73eeee3tteeeeeeeeeeeeeeeeeeeeeeeeeeeet33ee3eeeee33t*;;;7t3e33e333333333t33t33t3t3ttt3ttttt3ttttt77*;;;;'''''''''''''''..''''''''''.'...`.'`tNOONOONOONOONONOO",
"eee333ttteeeeeeeeeeeeeeete733t7;;*7tee3tteeeeeeeeeeeeee3eeeeeeett773eeee3e3tt****7te3e3333333333t3333t3t3t3t3ttt3t3ttt7**;''..'.'''';;;;*;;;;;;;;;;''.''.'.'` `''''''';73NOOOONOOONOONOOONO",
"eeett3t7eeeeeeeeeeeee3ee*t3eeeeee3t77**777tt3eeee3eee3e3e33t7;;;tt33ttt77777tt3e333333333333t333t33t3t3t3t3ttt7**;;;;;';;;;;'*77t7t7t77*;'''..``'.';.'''''''' 'OOOOOOONONOOOOOOOOOOONOOOOON",
"e3tt37teeee3eee3ee3eeee7*teeee3eeeeeee37*;''.``.`..';;'''''''';7tt7t3tt3333e33333333t333t33t3t33t3t33t7t***;;;;;*';tt7tttt7;77t*;77**;'``          .'`'''.'''``ONOOOOOOOOOOOOOOOOOOOOOOOOOO",
"373t*3e3ee3ee3e3e3e3e3e;7ee3ee3ee3ee3eeee37et77;'   '*t33333ee33e3e333e3333333333t33t3t33t3t33tt77*;;;;*777ttt77*;ttt7t7t*;7t7*;7*'.        `;;'    '`''.'''.. OOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"73t*3e3e33e33e3e33e3e3;*e3ee33e3e3e3e3e3e7333e3eee7;' `'*33ee3333e33333333t3333t33t3t3t3tt77*;'';;*;*ttttttt7*7;;7t7t77t*;77777*'           `;;;;     ...''... OOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"37733e333e3333e33e33e*;e33e33e333e333e3et73t3e333e3eet7;  .'73e33et3333t33t33t33t3ttt7***;;;;;7tt*;*tttt7tt7;*;;7t7t777*;777*7;             ';;;;'    ``'''..`.OOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"*t3e333333333e33333et'33e333333333e333337tt33333333e333et7''  ';7te33333333t377t;*;**7t7;';*7377;;*37tttt7;;;;;7t77*7**;777*7;     .        ;;;;;;    `''''`;.;OOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"3e33333333333t3333et't33333333333333333777e3333ttett333373*3`  ;;.`...'...`` `.'*ttttt;    ';**;*t777777*;';;;7****;7*77*7*7*.  3e'        .*;;;;'  ` ''''.`*`*NOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"333e3t33333t333t333'7333t3333t3333t333t*7e3t333t737t33t3*t;3' '`             ';77t7*';*''`    `';;;;7*7**'**7*7777*777*7**7*; .**.    `'. `;;;;;;. '`''''' .; eOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"3333t33t33t333t337't33t3t33t3t33t33t3t**3333t33*73*3t3t7t;73.                      *7ttt777*'`;*777t77777*77*777*7*7*7****7;';*  .`'''''`.;;;;;;' `'.'';'``''`OOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"33t3t333t3t33t33*'33t3t3t3t3tt3t3t337;733t3t3t3*7*tt3ttt;*t3'  '                   ttt77t77t77;777777777*777*7*7**7*****7**;*;*' ..'..'.';;;;;;;.''''';'. .'''OOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"ttt333t3t3t33t3;;33t3tt3tt3tt3ttt3t**t3tt3tt3t3;t;3t3tt;*3tt` ;3 'eO6.          `. ;t7t777t77777*7777*7*7*7*7***7*********;***;*;.. `.''*;;''';;;;''';;.` '' 7OOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
"33t33t3t3t3t37;73tt3t3ttt3tttttt37;7tt3ttttt3t7;;ttt37*7t3t' 'ttt@O;          .`. .77t77777777*77*77*7***7***7******;****;**;*;**;*;;*;;;;;;;;;;;'.;;'`' `'' ;6OOOOO6OOOOOOOO6OOOOOOOOOOOOO",
"33t3t3t3tt3t;*t3ttt3tttt3ttttttt7*tttttttttttt;;7ttt7*tttt;  ';73'     .   ``..``.*7777777*777*7*7**7*****7*****;****;**;*;*;*;*;*;;;;;*;;;;;;;;.'';''.  ''`   ;eOOOOOO6OOOO6OOOOOO6OOOOOOO",
"t3t3t3t3tt7;t3ttt3tttttt3tttttt7ttttttt7ttttt;.ttt7;7tttt;'  ;''*;   ``.''''''``'*7777*77*7*7*7**7***************;**;*;*;*;*;;*;;;;*;;;;;;;;;;;.';'''.  `''      'eOOOOO6OOOO6OOO6OOOO6OOOO",
"3t3tt3t37*73tt3ttttttttttttttttttt7tttttt7tt*`737;*7tttt;''`.77;;;*'   `.'.....;*777*7*7*7****7*************;***;*;*;*;;*;;;*;;;;;;;;;;;;;;;;'`';;.'`   ''         'eOOO6OO6OO6OOO6OOO6OOOO",
"t3tt3tt77t3ttt3tttttttttt7tttttt7tttt7ttt7t;'77*;7t7tt7;''* ;t7t77777*;'''';;;7*77*7**7***7********;******;**;*;*;*;;*;;;*;;;;;;;;;;;;;;;;;;`.;;'''`   ''.           ;6O6O6OO6O6OO6OO6OO6OO",
"tttttttt3ttttttt3tt7ttttttt7tttt7ttt7tt7t7';7;;7t7t7t*'';7' t7777777*7777777*7*7**7***7********;*****;**;**;*;*;;*;;;*;;;;;;;;;;;;;;;;;;;;'`';;'''.`  .''  ';          eOOO6O6O6O6OO6O6O6OO",
"ttttt3ttttttttttttttttt7ttttt7tt7tt7tt7t;';;;7t7t7t7*'';*7`;t*7777*7*7*7**7**7****7***********;***;**;*;*;*;;*;;;*;;;;;;;;;;;;;;;;;;;;;;'.';;'''.''   ;'   '77.         ;OO66O6O6O6O6O6OO6O",
"tttttttttttttttttttt7tttt7ttt7tt7tt7tt*'';*7t7t77t7;''7*7;.7777*7*7***7***7****************;**;**;**;*;;*;;*;;;;;*;;;;;;;;;;;;;;;;;;;;;'.;;'''.`';   ''``  '''*;         'OO66O6O66O66O6O6O",
"tttttttttttttt7ttt7ttt7tt7tt7tt7t7tt7;';77t7777t7*''*777*';77*7*7*7*****7**********;****;**;**;*;*;*;;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;''''';';';'  `''.`` ''''.';.        .6O666O6666O666O6",
"ttttt7ttttt7tt7ttt7tt7tt7t7tt7t7tt**;**t7*77777*';*7777;'*7*77**7**7**********;****;**;**;*;*;*;*;;;*;;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;.'';;;;';;'  `''... `''''..'''        `eO66O6666O6666O",
"ttttttt7ttt7ttt7tt7t7t7tt7t7t7t7*;;*7**7777t**;;777777;'*77*77**7****7****;***;***;*;*;*;*;*;;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.';;;;;';;'  .'''`'  '''.'.'...'.       `6666666O666666",
"tt7ttt7tt7tt7tt7t7t7t7tt7t7t7*;;;**7*7t77t77*7777777*;;*77*77**7**7********;***;*;*;*;*;;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;'';;;;;;;;;;'';;;;;';;.  '''.`'  `''.'..'..`..'       .O666666666666",
"7ttt7t7tt7tt7t7t7t7tt7t7t**;;;*7777t7t777t77777777;;;*;777*77**7**7********;***;*;*;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;'`';;;;;;;;;;'';;;;;';'  .''''`'`  ''''.......``.'       *O666e6666666",
"7tt7t7tt7tt7t7t7tt7t77*;;;**7t7t77t77t77777t777*;;;;*'77*77*7*7**7***7**;****;**;*;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;''';;;;;;;;;';;;;;';;';.  ';''..'.  ''.''.....`.````'`      e6666e666666",
"7t7t7tt7t7t7tt7t7**;;;**t7t77t77t77t77t77t7**;;***;7'';77*77*7*7**7********;***;*;*;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;';;';;';';'  '''';.`'.  ''.'.'...`.`.``` `.'     36666e66e666",
"7t7t7t7tt7t77**;;;*7t7t7t77t77t77t77t7t7*;;;*777**7''t;;;77*7*7**7**********;**;*;*;*;;;;;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;';;';;';'';';`  ''';'.`''  .''..'...`.``.` `` ``'    e6e66e66e66e",
"t7t7t7t7**;;**7t7tt77t7t77t77t77t77**;;;';77t77**7''7777;'*7*7*7****7*****;***;*;*;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;';';;'';'';''  ';''''..''  `'''.....`.`.``` ` `  `'  '66e6e6e6e6e6",
"t777*;*;*7t7t7tt77t7t7t7t7777*;;;;;;;;;;777t77**7';777*77*;;;7*7**7********;**;*;*;*;;;;*;;;;;;;;;;;;;;;;;;;;;;;;''''';';';';'';'';'  `''''''..'.  ..''.....`.``.` ``      .' 76e6e6e6ee6e6",
"*;**7t7ttt7tt7t7t7t7****;;;;*;7*7*;'';7t77t77***';t77*777*7*;;;*7*7*******;***;*;*;;*;;;;;;;*;;;;;;;;;;;;;;;'''''` .;';';';';'';''`  '''''''..'.  `''.....`.`.```` `  `     '''e6ee6ee6e6e6",
"77t77*7******;;*;;;;;***777tt7*;'';*t7t777t**7;'*7777*777*77***';;7******;***;*;*;;*;;;*;;;;;;;;;;;;;;;;;''''''';';;;';';'';'';..  `''''''''''.  ..'.....`.``````` `        .'''ee6ee6ee6ee",
";*;*;*;*;*7*7777***7t7t7tt7*;'';;7t7t777777*;''7777*777*7*7*7*7**;;;;7*;****;*;*;*;*;;;;*;;;;;;;;;;;;;'.`.''';';;;;';';';';''' `  .''''''''''.  .'..'.`..````````  `        .''..eee6eeeeee",
"7t7tt7tt7ttt77;;77t7tt7t*;'';*7t77t7777777*'`;t77*777*77*7**7**7*7*;;;;*****;**;*;*;;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;;';';'';'```.  '''''''''.'`  .'.....`.``````` `           .'''..36eeeeeee",
"t7tt7t7t7t7;;;7tt7tt7;;'';77t7t777t7777t*; .7t7*77777*7*7*7*7**7****7;;';;**;**;**;;*;;;;;;;;;;;;;;;;;;;;;;;;;;;';;';';''` ..` `.'''''''.''`  '......`.`````` `             .'''...eeeeeeee",
"t7t7t7t7*;;*7tt7t7;;';*7t7t7t77t777t7t*'   *77777777*7*7*7*7**7***7*****;;';;;**;*;;*;;;;;*;;;;;;;;;;;;;;;;;;;;';;';';'` ....``''''''''.''`  .'...`.`.``````                '''...`'eeeeeee",
"7t7tt*;;*7tt777*;;*77t7t77t77t77t77t;.`.   ;777777*77*77**7*7***7*********;*;;';;;;;*;;;;;*;;;;;;;;;;;;;;;;;;;';;;';'. `'.'' .''''''''.''   ......``.```` `                  .'..`. 'eeeeee",
"tt7;;;*tt7t*7**77t7t7t77t777t77t7t;``;77   't*777777*7*7*7*7**7**********;****;;;;;';;;;;*;;;;;;;;;;;;;;;;;';;;';;'.` '''''.`'''''''''.'    ....`.````````                    ...`.` 'eeeee",
"7;;;ttt777777t7t7t77t77t777t77t*'`.;7t77;   7777777*77*7*7**7****7*****;***;**;*;**;;;;';;';;;;;;;;;;;;;;;;;';;''`` .'''''.`''''''''.''    `..`..```````                       .`.``` *eeee",
";*tt7t7t7t7t7t77t77t*77777tt*;` '77t7777t`  *777777*77*7*7**7**7*******;**;**;*;*;*;;*;;;;;'.` `.'';;;;;;;;;;'``.  ''''''.`'''''''''.'  .  ..`..`.````                          ```` ` 7eee",
        },
          shortcut = {
          },
          packages = {enable = true},
          project = { enable = true, limit = 3 },
          mru = { enable = true, limit = 7 },
          footer = {},

        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons' } }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "mfussenegger/nvim-lint",
        config = function()
          require("config.linter")
        end,
      },
    },
    config = function()
      require("config.lspconfig")
    end, -- Override to setup mason-lspconfig
  },
}

return plugins
