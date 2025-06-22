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
      preset = 'default',
      ['<C-space>'] = { 'show', 'accept' },
      ['<C-k>'] = { 'show_documentation' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },

    fuzzy = {
      implementation = 'lua',
    },
  },
}
