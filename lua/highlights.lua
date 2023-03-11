vim.opt.background = 'dark'
vim.opt.colorcolumn = '+1' --Se ajusta con la propiedad 'textwidth'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5
vim.opt.wildoptions = 'pum'
vim.opt.winblend = 0

vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')
vim.cmd('au ColorScheme * hi StatusLine ctermbg=darkgray cterm=none guibg=darkgray gui=none')
vim.cmd('colorscheme tokyonight-night')

--vim.cmd('colorscheme nord')
--vim.cmd('colorscheme doom-one')
