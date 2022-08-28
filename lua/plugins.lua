local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer no esta instalado!')
  return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'drewtempelmeyer/palenight.vim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'folke/tokyonight.nvim'
  use 'vim-scripts/RltvNmbr.vim' -- Columna de numeros relativos
  use 'cohama/lexima.vim' -- Cerrar simbolos
  use 'norcalli/nvim-colorizer.lua' -- Colores
  use 'lukas-reineke/indent-blankline.nvim'
  use 'preservim/nerdcommenter'
  use 'lewis6991/gitsigns.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*', config = function()
      require('toggleterm').setup()

    end
  }
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "folke/trouble.nvim"
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'Shougo/defx.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/bufferline.nvim'
  use {
    'glepnir/lspsaga.nvim',
    branch = "main"
  }
end)
