-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  })

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'

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
          mappings = {
            custom_only = false,
            list = {}
          }
        }
      })
    end
  })

  use({
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          numbers = 'ordinal',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. context .. diagnostics_dict[level] .. ")"
          end,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          separator_style = 'thin',
          always_show_bufferline = true,
          sort_by = 'id',
        }
      })
    end
  })

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
    run = 'yarn install --frozen-lockfile',
  }
  use('coc-extensions/coc-svelte')
  use('leafOfTree/vim-svelte-plugin')
  use {
    'prettier/vim-prettier',
    run = 'pnpm install',
  }
  use('Shougo/context_filetype.vim')

  use('folke/zen-mode.nvim')
  use('github/copilot.vim')
  use('eandrju/cellular-automaton.nvim')
  use('laytan/cloak.nvim')
  use('ziglang/zig.vim')
end)
