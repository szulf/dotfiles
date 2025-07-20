return {
  'stevearc/oil.nvim',

  lazy = false,

  opts = {
    view_options = {
      show_hidden = true,
    },
  },

  config = function(_, opts)
    require('oil').setup(opts)

    Nmap('<leader>e', function() vim.cmd('Oil') end)
  end,
}
