local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup {
    symbol_in_winbar = {
        enable = true,
        separator = ' > ', --'  ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
    outline = {
        custom_sort = 'true'
    },
    ui = {
        -- currently only round theme
        theme = 'round',
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'solid',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = '🐞',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#1d1536',
            --title background color
            title_bg = '#afd700',
            red = '#e95678',
            magenta = '#b33076',
            orange = '#FF8700',
            yellow = '#f7bb3b',
            green = '#afd700',
            cyan = '#36d0e0',
            blue = '#61afef',
            purple = '#CBA6F7',
            white = '#d1d4cf',
            black = '#1c1c19',
        },
        kind = {},
    },
}

local opts = {
    noremap = true,
    silent = true
}
vim.keymap.set('n', '<C-4>', '<Cmd>Lspsaga outline<cr>', opts)
vim.keymap.set('n', 'gj', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'gra', '<Cmd>Lspsaga rename ++project<cr>', opts)
vim.keymap.set('n', 'ca', '<Cmd>Lspsaga code_action<cr>', opts)
