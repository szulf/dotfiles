return {
    'stevearc/conform.nvim',

    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },

        formatters_by_ft = {
            cpp = { 'clang_format' },
        },

        formatters = {
            clang_format = {
                prepend_args = { '-style=file:/home/user/.clang-format' },
            },
        },
    },

    config = function(_, opts)
        require('conform').setup(opts)
    end
}
