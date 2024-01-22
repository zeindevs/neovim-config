local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Color
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Go
  use 'ray-x/go.nvim'

  use 'nvim-lualine/lualine.nvim'       -- Statusline
  use 'nvim-lua/plenary.nvim'           -- Common utilities
  use 'onsails/lspkind-nvim'            -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'hrsh7th/cmp-nvim-lua'
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use 'terrotylor/nvim-comment'
  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'

  -- Terminal
  use {
    'akinsho/toggleterm.nvim', tag = '*'
  }

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Prettier
  use 'MunifTanjim/prettier.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
end)
