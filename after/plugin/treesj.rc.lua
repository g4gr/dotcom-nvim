
local status, treesj = pcall(require, 'treesj')
if (not status) then return end


local lang_utils = require('treesj.langs.utils')
local css = require('treesj.langs.css')

local langs = {
    javascript = {
        object = lang_utils.set_preset_for_dict(),
        array = lang_utils.set_preset_for_list(),
        formal_parameters = lang_utils.set_preset_for_args(),
        arguments = lang_utils.set_preset_for_args(),
        statement_block = lang_utils.set_preset_for_statement({
            join = {
                no_insert_if = {
                    'function_declaration',
                    'try_statement',
                    'if_statement',
                },
            },
        }),
    },
    lua = {
        table_constructor = lang_utils.set_preset_for_dict(),
        arguments = lang_utils.set_preset_for_args(),
        parameters = lang_utils.set_preset_for_args(),
    },
    HTML = {},
    CSS = {} ,
    SCSS = {} ,
    Python = {} ,
    Go = {} ,
    Java = {} ,
    Kotlin = {} ,
}

treesj.setup ({
  -- Use default keymaps
  -- (<space>m - toggle, <space>j - join, <space>s - split)
  use_default_keymaps = true,

  -- Node with syntax error will not be formatted
  check_syntax_error = true,

  -- If line after join will be longer than max value,
  -- node will not be formatted
  max_join_length = 120,

  -- hold|start|end:
  -- hold - cursor follows the node/place on which it was called
  -- start - cursor jumps to the first symbol of the node being formatted
  -- end - cursor jumps to the last symbol of the node being formatted
  cursor_behavior = 'hold',

  -- Notify about possible problems or not
  notify = true,
  langs = langs,

  -- Use `dot` for repeat action
  dot_repeat = true,
})
