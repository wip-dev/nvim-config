require('catppuccin').setup({
    flavour = "mocha",
    no_italic = true,
    -- custom_highlights = function(colors)
    --     return {
    --         Normal = { bg = colors.crust }
    --     }
    -- end
})

vim.cmd.colorscheme "catppuccin"

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                cond = nil,            -- Condition function, the component is loaded when the function returns `true`.
                draw_empty = false,    -- Whether to draw component even if it's empty.
                padding = 1,           -- Adds padding to the left and right of components.
                fmt = function(str, _) -- Format function, formats the component's output.
                    return " " .. str
                end,
            }
        }
    }
})
