return {
    'folke/which-key.nvim',

    opts = {},

    config = function(_, opts)
        local key = require('which-key')
        key.setup(opts)

        Map('<leader>?', function() key.show({ global = false }) end, 'whichkeys')

        key.add({
            { '<leader>p', group = 'project' },
            { '<leader>d', group = 'debug' },
            { '<leader>g', group = 'git' },
            { '<leader>f', group = 'files' },
            { '<leader>c', group = 'code' },
            { '<leader>b', group = 'buffers' },
        })
    end,
}
