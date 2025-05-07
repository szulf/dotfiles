return {
    'saghen/blink.cmp',

    version = '1.*',

    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    opts = {
        keymap = {
            preset = 'default',
            ['<C-space>'] = { 'show', 'accept' },
            ['<C-k>'] = { 'show_documentation' },
        },

        fuzzy = {
            implementation = 'lua',
        },
    },
}
