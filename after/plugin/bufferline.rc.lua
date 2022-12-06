local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local groups = require('bufferline.groups')

bufferline.setup {
    options = {
        close_command = 'bdelete! %d',
        themable = true,
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        numbers = function(opts)
            return string.format('%s.%s', opts.ordinal, opts.id)
        end,
        diagnostic = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        enforce_regular_tabs = true,
        tab_size = 25,
        color_icons = true,
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
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
                if error ~= 0 then
                    table.insert(result, { text = "  " .. error, fg = "#EC5241" })
                end
                if warning ~= 0 then
                    table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
                end
                if hint ~= 0 then
                    table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
                end
                if info ~= 0 then
                    table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
                end
                return result
            end,
        }
    },
    options = {
        close_command = 'bdelete! %d',
        themable = true,
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        numbers = function(opts)
            return string.format('%s.%s', opts.ordinal, opts.id)
        end,
        diagnostic = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        enforce_regular_tabs = true,
        tab_size = 25,
        color_icons = true,
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
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
                if error ~= 0 then
                    table.insert(result, { text = "  " .. error, fg = "#EC5241" })
                end
                if warning ~= 0 then
                    table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
                end
                if hint ~= 0 then
                    table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
                end
                if info ~= 0 then
                    table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
                end
                return result
            end,
        }
    },
}


vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>:bdelete! <Return><C-w>w<cr>', {})
