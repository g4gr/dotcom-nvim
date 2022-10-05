local status, wilder = pcall(require, 'wilder')
if (not status) then
    return
end


wilder.setup(
    {
        modes = { ':', '/', '?' }
    }
)

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline(),
        wilder.search_pipeline()
    ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'Normal', -- highlight to use for the border
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'rounded',
        pumblend = 10,
        highlighter = wilder.basic_highlighter(),
        prompt_position = 'top',
        max_height = '75%',
        min_height = 0,
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
    })
))
