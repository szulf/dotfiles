return {
    'echasnovski/mini.pairs',

    version = '*',

    event = 'InsertEnter',

    opts = {
        mappings = {
            ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
            ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        },
    },

    config = function(_, opts)
        local pairs = require('mini.pairs')
        pairs.setup(opts)
    end,
}
