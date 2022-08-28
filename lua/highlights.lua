vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5
vim.opt.wildoptions = 'pum'
vim.opt.winblend = 0
vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')
vim.cmd('hi default HL_RltvNmbr_Minus gui=none,italic ctermfg=red ctermbg=none guifg=red guibg=none')
vim.cmd('hi default HL_RltvNmbr_Positive gui=none,italic ctermfg=green ctermbg=none guifg=green guibg=none')
vim.cmd('colorscheme tokyonight')
--vim.cmd('colorscheme nord')


vim.g.bookmark_sign = 'ﯠ'
vim.g.bookmark_annotation_sign = ''

vim.g.rltvnbr = 1
