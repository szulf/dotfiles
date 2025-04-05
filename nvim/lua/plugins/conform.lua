return {
    'stevearc/conform.nvim',

    opts = {
        format_on_save = {
            timeout_ms = 2000,
            lsp_format = 'fallback',
        },

        formatters_by_ft = {
            cpp = { 'clang_format' },

            typescript = { 'prettier' },
            html = { 'prettier' },
            css = { 'prettier' },
            htmlangular = { 'prettier' },

            cs = { 'csharpier' },
        },

        formatters = {
            clang_format = {
                prepend_args = { '-style=file:/home/user/.clang-format' },
            },

            csharpier = {
                args = { 'csharpier', '--write-stdout', '$FILENAME' },
            },
        },
    },

    config = function(_, opts)
        require('conform').setup(opts)
    end
}
