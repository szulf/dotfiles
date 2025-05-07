return {
    'catppuccin/nvim',

    lazy = false,

    priority = 1000,

    opts = {
        color_overrides = {
            mocha = {
                base = '#181818',
                mantle = '#181818',
                crust = '#181818',
            },
        },
    },

    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd('colorscheme catppuccin')

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#2C2D3B', fg = '#9399B2', })
    end
}
