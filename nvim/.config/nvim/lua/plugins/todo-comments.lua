return {
    'folke/todo-comments.nvim',

    opts = {},

    config = function(_, opts)
        local todo = require('todo-comments')
        todo.setup(opts)

        Map('<leader>pt', function() vim.cmd('TodoFzfLua') end, 'project todos')
    end,
}
