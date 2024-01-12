require('catppuccin').setup({
    flavour = "mocha",
    no_italic = true,
    custom_highlights = function(colors)
        return {
            Normal = { bg = colors.crust }
        }
    end
})

vim.cmd.colorscheme "catppuccin"

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = '', right = '' },
    }
})
