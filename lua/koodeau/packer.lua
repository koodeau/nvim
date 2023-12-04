-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'kyazdani42/nvim-web-devicons'
  use "lukas-reineke/indent-blankline.nvim"

  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  })

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'xiyaowong/nvim-transparent'

  -- use({
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     require("notify").setup({
  --       background_colour = "#000000" -- "#2f3037",
  --     })
  --   end
  -- })

  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        -- lsp = {
        --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        --   override = {
        --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        --     ["vim.lsp.util.stylize_markdown"] = true,
        --     ["cmp.entry.get_documentation"] = true,
        --   },
        -- },
        -- -- you can enable a preset for easier configuration
        -- presets = {
        --   bottom_search = false,        -- use a classic bottom cmdline for search
        --   command_palette = true,       -- position the cmdline and popupmenu together
        --   long_message_to_split = true, -- long messages will be sent to a split
        --   inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        --   lsp_doc_border = true,        -- add a border to hover docs and signature help
        -- },
        cmdline = {
          enabled = true,         -- enables the Noice cmdline UI
          view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
          opts = {},              -- global options for the cmdline. See section on views
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
          },
        },
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          enabled = false,             -- enables the Noice messages UI
          view = "notify",             -- default view for messages
          view_error = "notify",       -- view for errors
          view_warn = "notify",        -- view for warnings
          view_history = "messages",   -- view for :messages
          view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
          enabled = true,  -- enables the Noice popupmenu UI
          ---@type 'nui'|'cmp'
          backend = "nui", -- backend to use to show regular cmdline completions
          -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
          kind_icons = {}, -- set to `false` to disable icons
        },
        -- default options for require('noice').redirect
        -- see the section on Command Redirection
        -- redirect = {
        --   view = "popup",
        --   filter = { event = "msg_show" },
        -- },
        -- You can add any custom commands below that will be available with `:Noice command`
        commands = {
          history = {
            -- options for the message history that you get with `:Noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp",      kind = "message" },
              },
            },
          },
          -- :Noice last
          last = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp",      kind = "message" },
              },
            },
            filter_opts = { count = 1 },
          },
          -- :Noice errors
          errors = {
            -- options for the message history that you get with `:Noice`
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = { error = true },
            filter_opts = { reverse = true },
          },
        },
        notify = {
          -- Noice can be used as `vim.notify` so you can route any notification like other messages
          -- Notification messages have their level and other properties set.
          -- event is always "notify" and kind can be any log level as a string
          -- The default routes will forward notifications to nvim-notify
          -- Benefit of using Noice for this is the routing and consistent history view
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type string
            format = "lsp_progress",
            --- @type string
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
          },
          override = {
            -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            -- override the lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = false,
            -- override cmp documentation with Noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = true,

          },
          hover = {
            enabled = true,
            silent = true, -- set to true to not show a message if hover is not available
            view = nil,    -- when nil, use defaults from documentation
            opts = {},     -- merged with defaults from documentation
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50,  -- Debounce lsp signature help request by 50ms
            },
            view = nil,       -- when nil, use defaults from documentation
            opts = {},        -- merged with defaults from documentation
          },
          message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = "notify",
            opts = {},
          },
          -- defaults for hover and signature help
          documentation = {
            view = "hover",
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },
        markdown = {
          hover = {
            ["|(%S-)|"] = vim.cmd.help,                       -- vim help links
            ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
          },
          highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
          },
        },
        health = {
          checker = true, -- Disable if you don't want health checks to run
        },
        smart_move = {
          -- noice tries to move out of the way of existing floating windows.
          enabled = true, -- you can disable this behaviour here
          -- add any filetypes here, that shouldn't trigger smart move.
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },
        presets = {
          -- you can enable a preset by setting it to true, or a table that will override the preset config
          -- you can also add custom presets that you can enable/disable with enabled=true
          bottom_search = false,         -- use a classic bottom cmdline for search
          command_palette = false,       -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false,            -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,        -- add a border to hover docs and signature help
        },
        throttle = 1000 / 30,            -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        views = {}, ---@see section on views
        routes = {},                     --- @see section on routes
        status = {},                     --- @see section on statusline components
        format = {},                     --- @see section on formatting
        -- add any options here
        -- routes = {
        --   {
        --     view = "notify",
        --     filter = { event = "msg_showmode" },
        --   },
        -- },
      })
    end
  })

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    -- tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'arzg/vim-colors-xcode',
    as = 'xcodedark',
    config = function()
      vim.cmd('colorscheme xcodedark')
    end
  })

  use {
    'mhinz/vim-signify',
    config = function()
      vim.g.signify_sign_add = '┃'
      vim.g.signify_sign_delete = '•'
      vim.g.signify_sign_delete_first_line = '┃'
      vim.g.signify_sign_change = '┃'
      vim.g.signify_sign_show_count = 0
    end
  }

  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = false,
        update_focused_file = {
          enable = true,
          update_cwd = false,
        },
        system_open = {
          cmd = nil,
          args = {}
        },
        view = {
          width = 25,
          side = 'left',
        }
      })
    end
  })

  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end
  })

  -- use 'nvim-lualine/lualine.nvim'

  -- use({
  --   'akinsho/nvim-bufferline.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('bufferline').setup({
  --       options = {
  --         -- numbers = 'ordinal',
  --         -- diagnostics = 'nvim_lsp',
  --         -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --         --   return "(" .. count .. context .. diagnostics_dict[level] .. ")"
  --         -- end,
  --         show_buffer_close_icons = false,
  --         show_close_icon = false,
  --         show_tab_indicators = false,
  --         separator_style = 'thin',
  --         always_show_bufferline = false,
  --         -- sort_by = 'id',
  --       }
  --     })
  --   end
  -- })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = { 'sh', 'zsh', 'bash', 'html', 'markdown', 'vim', 'lua', 'rust',
      'javascript', 'typescript', 'json', 'yaml', 'toml', 'dockerfile', 'go',
      'postcss', 'sql', 'css', 'scss', 'less', 'sass', 'graphql', 'svelte' },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use({
    'folke/trouble.nvim',
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require('trouble').setup {
        icons = true,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end, }
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('theprimeagen/refactoring.nvim')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-treesitter/nvim-treesitter-context')
  use('nvim-treesitter/nvim-treesitter-refactor')
  use('preservim/nerdtree')
  use('ryanoasis/vim-devicons')
  use('Xuyuanp/nerdtree-git-plugin')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')
  use('itchyny/lightline.vim')

  -- use("")
  use('easymotion/vim-easymotion')
  use {
    'neoclide/coc.nvim',
    -- branch = "release",
    -- run = 'yarn install --frozen-lockfile',
    run = 'bun i --frozen-lockfile',
  }
  use('coc-extensions/coc-svelte')
  use('leafOfTree/vim-svelte-plugin')
  use {
    'prettier/vim-prettier',
    run = 'bun i',
  }
  use('Shougo/context_filetype.vim')

  use('folke/zen-mode.nvim')
  -- use('github/copilot.vim')
  use('eandrju/cellular-automaton.nvim')
  use('laytan/cloak.nvim')
  use('ziglang/zig.vim')

  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end
  })

  use({
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup({})
    end
  })

  -- use({
  --   'rmagatti/goto-preview',
  --   config = function()
  --     require('goto-preview').setup {
  --       width = 120, -- Width of the floating window
  --       height = 15, -- Height of the floating window
  --       border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
  --       default_mappings = true,
  --       debug = false, -- Print debug information
  --       opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
  --       resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
  --       post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
  --       references = { -- Configure the telescope UI for slowing the references cycling window.
  --         telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
  --       },
  --       -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  --       focus_on_open = true,                                        -- Focus the floating window when opening it.
  --       dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
  --       force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  --       bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
  --       stack_floating_preview_windows = true,                       -- Whether to nest floating windows
  --       preview_window_title = { enable = true, position = "left" }, -- Whether
  --     }
  --   end
  -- })

  use({
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  })
end)
