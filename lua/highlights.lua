vim.opt.background = 'dark'
vim.opt.colorcolumn = '+1' --Se ajusta con la propiedad 'textwidth'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5
vim.opt.wildoptions = 'pum'
vim.opt.winblend = 0

vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')
vim.cmd('hi default HL_RltvNmbr_Minus gui=none,italic ctermfg=red ctermbg=none guifg=red guibg=none')
vim.cmd('hi default HL_RltvNmbr_Positive gui=none,italic ctermfg=green ctermbg=none guifg=green guibg=none')
vim.cmd('colorscheme tokyonight-night')

--vim.cmd('colorscheme nord')
--vim.cmd('colorscheme doom-one')
vim.g.rltvnbr = 1
