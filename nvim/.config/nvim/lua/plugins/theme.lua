return {
  'ellisonleao/gruvbox.nvim',

  lazy = false,

  priority = 1000,

  opts = {
    overrides = {
      SignColumn = { bg = '#000000' },
      Delimiter = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },

      Function = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@function'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@function.call'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@function.builtin'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@function.method'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@method'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@method.call'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@method.call'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },

      ['@constructor'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@property'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@lsp.type.property'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@parameter'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@lsp.type.parameter'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@variable.parameter'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@variable.parameter.builtin'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
      ['@variable.member'] = { fg = vim.api.nvim_get_hl_by_name('@text', true).foreground },
    },
  },

  config = function(_, opts)
    require('gruvbox').setup(opts)
    vim.cmd.colorscheme('gruvbox')
  end,
}
