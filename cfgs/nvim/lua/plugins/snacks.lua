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
        },
    },

    keys = {
        { '<leader><leader>', function() Snacks.picker.files() end,            desc = 'find files' },
        { '<leader>pf',       function() Snacks.picker.files() end,            desc = 'find files' },
        { '<leader>pg',       function() Snacks.picker.grep() end,             desc = 'grep through files' },
        { '<leader>fd',       function() Snacks.picker.diagnostics() end,      desc = 'look through diagnostics' },
        { 'gr',               function() Snacks.picker.lsp_references() end,   desc = 'look through lsp references' },
        { 'gd',               function() Snacks.picker.lsp_definitions() end,  desc = 'look through lsp definitions' },
        { 'gD',               function() Snacks.picker.lsp_declarations() end, desc = 'look through lsp declarations' },
        { '<leader>fe',       function() Snacks.explorer() end,                desc = 'open the file explorer' },
    },
}
