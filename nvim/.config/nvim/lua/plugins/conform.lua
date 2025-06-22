return {
  'stevearc/conform.nvim',

  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },

    formatters_by_ft = {
      cpp = { 'clang_format' },
      glsl = { 'clang_format' },

      typescript = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      htmlangular = { 'prettier' },
    },

    formatters = {
      clang_format = {
        prepend_args = { '-style=file:/home/szulf/.clang-format' },
      },
    },
  },

  config = function(_, opts)
    require('conform').setup(opts)
  end
}
