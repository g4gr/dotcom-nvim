local status, packer = pcall(require, 'packer')
if (not status) then
    print('Packer no esta instalado!')
    return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    --Temas
    use { 'drewtempelmeyer/palenight.vim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'arcticicestudio/nord-vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'gelguy/wilder.nvim'
    use 'folke/tokyonight.nvim'

    use {
        'noib3/nvim-cokeline',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'vim-scripts/RltvNmbr.vim' -- Columna de numeros relativos
    use 'cohama/lexima.vim' -- Cerrar simbolos
    use 'norcalli/nvim-colorizer.lua' -- Colores
    use 'itchyny/vim-cursorword'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'preservim/nerdcommenter' --Comentarios
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'dm1try/golden_size'
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
    use 'xiyaowong/telescope-emoji.nvim'
    use {
        'glepnir/lspsaga.nvim',
        branch = "main"
    }
end)
