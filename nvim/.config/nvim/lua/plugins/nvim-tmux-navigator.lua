return {
    'christoomey/vim-tmux-navigator',

    Map("<C-h>", function() vim.cmd("TmuxNavigateLeft") end),
    Map("<C-j>", function() vim.cmd("TmuxNavigateDown") end),
    Map("<C-k>", function() vim.cmd("TmuxNavigateUp") end),
    Map("<C-l>", function() vim.cmd("TmuxNavigateRight") end),
}
