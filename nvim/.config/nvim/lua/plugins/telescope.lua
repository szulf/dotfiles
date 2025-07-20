return {
  'nvim-telescope/telescope.nvim',

  opts = {
    defaults = {
      file_ignore_patterns = { '.git', 'build' },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },

  config = function(_, opts)
    require('telescope').setup(opts)

    local builtin = require('telescope.builtin')

    Nmap('<leader>f', builtin.find_files)
    Nmap('<leader>g', builtin.live_grep)
    Nmap('<leader>s', builtin.treesitter)
  end
}
