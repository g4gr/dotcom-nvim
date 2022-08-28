local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'html',
    'css',
    'scss',
    'javascript',
    'json',
    'tsx',
    'lua',
    'sql',
  },
  autotag = {
    enable = true
  }
}
