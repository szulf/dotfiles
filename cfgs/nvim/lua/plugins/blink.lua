return {
    'saghen/blink.cmp',

    version = '1.*',

    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'super-tab',
            ['<C-j>'] = { 'select_next' },
            ['<C-k>'] = { 'select_prev' },
        },

        fuzzy = {
            implementation = 'lua',
        },
    },
}
