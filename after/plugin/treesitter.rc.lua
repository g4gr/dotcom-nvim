local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {}
    },
    ensure_installed = {
        'html',
        'markdown_inline',
        'markdown',
        'pug',
        'css',
        'scss',
        'javascript',
        'json',
        'tsx',
        'lua',
        'python',
        'sql',
        'kotlin',
        'gitignore',
        'gitcommit'
    },
    autotag = {
        enable = true
    },
    sync_install = false,
    auto_install = true,
}
