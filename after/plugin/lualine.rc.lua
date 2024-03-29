local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local modeComponent = {
    'mode',
    separator = {
        right = ''
    },
    icons_enable = true,
    padding = 1
}

local fileformatComponent = {
    'fileformat',
    separator = {
        left = ''
    },
    icons_enable = true,
    padding = 1,
}

lualine.setup {
    options = {
        component_separators = { left = '', right = '' },
        icons_enable = true,
        theme = 'auto',
        section_separators = {
            section_separators = { left = '', right = '' },
        },
        always_divide_middle = true,
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { modeComponent },
        lualine_b = {
            {
                'filetype',
                colored = true,
                icon = {
                    align = 'right'
                }
            },
            {
                'filename',
                file_status = true,
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                },
                show_filename_only = true,
                hide_filename_extension = true,
                path = 0
            },
            {
                'filesize',
                separator = {
                    right = ''
                },
                icons_enable = true,
                padding = 1
            }
        },
        lualine_c = { 'b:gitsigns_status' },  --branch
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                {
                    symbols = { error = '', warn = '', info = '', hint = '' }
                },

            }
        },
        lualine_y = {},
        lualine_z = {
            fileformatComponent,
            'progress',
            'location'
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
