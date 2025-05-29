return {
    'folke/snacks.nvim',

    lazy = false,

    priority = 1000,

    opts = {
        explorer = { enabled = true },

        dashboard = {
            enabled = true,

            preset = {
                header = [[
  ██████╗ ██████╗ ██████╗ ███████╗
 ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗
██║     ██║   ██║██║  ██║██╔══╝
 ╚██████╗╚██████╔╝██████╔╝███████╗
  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
neovim
 ]],
            },

            sections = {
                { section = 'header' }
            }
        },

        picker = {
            enabled = true,

            sources = {
                explorer = {
                    auto_close = true,
                    hidden = true,
                    ignored = true,
                },

                files = {
                    hidden = true,
                },
            },

            layout = {
                preview = "main",
                preset = "ivy",
            },
        },
    },

    config = function(_, opts)
        local snacks = require('snacks')
        snacks.setup(opts)

        Map('<leader><leader>', snacks.picker.files, 'find files')
        Map('<leader>pf', snacks.picker.files, 'find files')
        Map('<leader>pg', snacks.picker.grep, 'grep through files')
        Map('<leader>pd', Snacks.picker.diagnostics, 'diagnostics')
        Map('gr', Snacks.picker.lsp_references, 'lsp references')
        Map('gd', Snacks.picker.lsp_definitions, 'lsp definitions')
        Map('gD', Snacks.picker.lsp_declarations, 'lsp declarations')
    end,
}
