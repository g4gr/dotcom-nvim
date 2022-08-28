vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.nu = true

vim.opt.ai = true
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.expandtab = true
vim.opt.formatoptions:append { 'r' }
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.path:append { '**' }
vim.opt.tabstop = 2
vim.opt.title = true
vim.opt.si = true
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.smarttab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'kitty'
vim.opt.swapfile = true
vim.opt.wildmenu = true
vim.opt.wildignore:append { '*/node_modules/*' }

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = 'set nopaste'
})
