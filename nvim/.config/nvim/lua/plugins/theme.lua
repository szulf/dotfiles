return {
    'aktersnurra/no-clown-fiesta.nvim',

    lazy = false,

    priority = 1000,

    config = function()
        vim.cmd('colorscheme no-clown-fiesta')

        vim.api.nvim_set_hl(0, 'Normal', { bg = "#181818" })
    end
}
