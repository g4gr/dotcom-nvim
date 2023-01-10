local get_hex = require('cokeline/utils').get_hex
local str_rep = string.rep

--local green = '#06D6A0'
local yellow = "#FBBF24"
local selected = "#4f5d75"

local comments_fg = get_hex('Comment', 'fg')
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

local min_buffer_width = 30

local components = {
    separator = {
        text = ' ',
        bg = get_hex('Normal', 'bg'),
        truncation = { priority = 1 },
    },

    space = {
        text = ' ',
        truncation = { priority = 1 },
    },

    left_half_circle = {
        text = '',
        fg = function(buffer)
            if buffer.is_focused then
                return selected
            end
            return get_hex('ColorColumn', 'bg')
        end,
        bg = get_hex('Normal', 'bg'),
        truncation = { priority = 1 },
    },

    right_half_circle = {
        text = '',
        fg = function(buffer)
            if buffer.is_focused then
                return selected
            end
            return get_hex('ColorColumn', 'bg')
        end,
        bg = get_hex('Normal', 'bg'),
        truncation = { priority = 1 },
    },

    devicon = {
        text = function(buffer)
            return buffer.devicon.icon
        end,
        fg = function(buffer)
            return buffer.devicon.color
        end,
        truncation = { priority = 1 },
    },

    index = {
        text = function(buffer)
            return buffer.index .. ': '
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
        end,
        truncation = { priority = 1 },
    },

    unique_prefix = {
        text = function(buffer)
            return buffer.unique_prefix
        end,
        fg = comments_fg,
        style = 'italic',
        truncation = {
            priority = 3,
            direction = 'left',
        },
    },

    filename = {
        text = function(buffer)
            return buffer.filename
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
        end,
        style = function(buffer)
            return ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
                and 'bold,underline')
                or (buffer.is_focused and 'bold')
                or (buffer.diagnostics.errors ~= 0 and 'underline')
                or nil
        end,
        truncation = {
            priority = 2,
            direction = 'left',
        },
    },
    diagnostics = {
        text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
                or ' 👌'
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
        end,
        truncation = { priority = 1 },
    },
    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and '●' or ''
        end,
        fg = function(buffer)
            return buffer.is_modified and yellow or nil
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
}

local get_remaining_space = function(buffer)
    local used_space = 0
    for _, component in pairs(components) do
        used_space = used_space + vim.fn.strwidth(
            (type(component.text) == 'string' and component.text)
            or (type(component.text) == 'function' and component.text(buffer))
        )
    end
    return math.max(0, min_buffer_width - used_space)
end

local left_padding = {
    text = function(buffer)
        local remaining_space = get_remaining_space(buffer)
        return str_rep(' ', remaining_space / 2 + remaining_space % 2)
    end,
}

local right_padding = {
    text = function(buffer)
        local remaining_space = get_remaining_space(buffer)
        return str_rep(' ', remaining_space / 2)
    end,
}

require('cokeline').setup({
    show_if_buffers_are_at_least = 2,

    buffers = {
        -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
        -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
        focus_on_delete = 'next',
        new_buffers_position = 'next',
    },

    rendering = {
        max_buffer_width = 30,
    },

    default_hl = {
        fg = function(buffer)
            if buffer.is_focused then
                return get_hex('Normal', 'fg')
            end
            return get_hex('Comment', 'fg')
        end,
        bg = function(buffer)
            if buffer.is_focused then
                return selected
            end
            return get_hex("ColorColumn", "bg")
        end,

    },

    sidebar = {
        filetype = 'NvimTree',
        components = {
            {
                text = '  NvimTree',
                fg = yellow,
                bg = get_hex('NvimTreeNormal', 'bg'),
                style = 'bold',
            },
        }
    },

    components = {
        components.separator,
        components.left_half_circle,
        left_padding,
        components.devicon,
        components.index,
        components.unique_prefix,
        components.filename,
        components.space,
        {
            text = function(buffer)
                if buffer.is_readonly then
                    return " 🔒"
                end
                return ""
            end
        },
        right_padding,
        components.close_or_unsaved,
        components.space,
        components.right_half_circle,
        components.separator,
    },
})

local map = vim.api.nvim_set_keymap

map('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = true })

vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>:bdelete! <Return><C-w>w<cr>', {})
