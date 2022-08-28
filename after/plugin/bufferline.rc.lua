local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local groups = require('bufferline.groups')

bufferline.setup {
  options = {
    close_command = 'bdelete! %d',
    themable = true,


  },
  diagnostics = "nvim_lsp",

  highlights = {
    background = {
      fg = '',
      bg = '',

    },
    buffer_selected = {
      fg = '#06D6A0',
      underline = false,
      undercur = 'bold'
    },
  },

}


vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>:bdelete! <Return><C-w>w<cr>', {})
