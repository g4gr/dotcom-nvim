local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local emoji = require("telescope").load_extension("emoji")
local gh = require('telescope').load_extension('gh')

function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
    defaults = {
        mapping = {
            n = {
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
                ['q'] = actions.close
            }
        },
        sorting_strategy = "ascending",
        prompt_prefix = "🤔 ",
        selection_caret = "👉"
    },
    extensions = {
        file_browser = {
            layout_strategy = "horizontal",
            theme = "cursor",
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ['N'] = fb_actions.create,
                    ['h'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                },
            }
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg", "svg", "pdf" },
            find_cmd = "rg" -- find command (defaults to `fd`)
        },
        emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- -- {name="", value="", cagegory="", description=""}

                vim.fn.setreg("*", emoji.value)
                print([[Press p or "*p to paste this emoji]] .. emoji.value)

                -- insert emoji when picked
                -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
        }

    }
}

telescope.load_extension('file_browser')
telescope.load_extension('media_files')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>ff',
    '<cmd>lua require("telescope.builtin").find_files( { path = "%:p:h", no_ignore = false , respect_git_ignore = false , hidden = true , layout_config = { prompt_position = "top" } } )<cr>'
    , opts)
vim.keymap.set('n', '<Leader>fg',
    '<cmd>lua require("telescope.builtin").live_grep({ layout_config = { prompt_position = "top" } } )<cr>', opts)
vim.keymap.set('n', '<Leader>fb',
    '<cmd>lua require("telescope.builtin").buffers( {layout_config = { prompt_position = "top" } } )<cr>', opts)
vim.keymap.set('n', '<Leader>fd',
    '<cmd>lua require("telescope.builtin").diagnostics( {layout_config = { prompt_position = "top" } } )<cr>', opts)
vim.keymap.set('n', '<Leader>ft', '<cmd>:TodoTelescope<cr>', opts)
vim.keymap.set('n', '<Leader>fs',
    '<cmd>lua require("telescope").extensions.file_browser.file_browser( { path = "%:p:h" , cwd = telescope_buffer_dir(), respect_git_ignore = false , hidden = true , grouped = true , preview = false , initial_mode = "normal" , layout_config = { height = 40 , width = 130 , prompt_position = "top" } , layout_strategy = "flex" } ) <cr>'
    , opts)
vim.keymap.set('n', '<leader>fi', '<cmd>:Trouble lsp_implementations<cr>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>:Trouble lsp_references<cr>', opts)
vim.keymap.set('n', '<leader>fe', '<cmd>:Telescope emoji<cr>', opts)
vim.keymap.set('n', '<leader>fk', '<cmd>:Telescope keymaps<cr>', opts)
vim.keymap.set('n', '<leader>fh', '<cmd>:Telescope gh gist<cr>', opts) -- Mas info en https://cli.github.com/manual/
