return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,

  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.install({ 'lua', 'vimdoc', 'cpp' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'cpp' },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
}
