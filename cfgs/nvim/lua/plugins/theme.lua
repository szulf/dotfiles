return {
    'catppuccin/nvim',

    lazy = false,

    priority = 1000,

    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd('colorscheme catppuccin')
    end
}
