return {
    'neovim/nvim-lspconfig',

    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                Map('<leader>ca', vim.lsp.buf.code_action, 'code action')
                Map('<leader>cr', vim.lsp.buf.rename, 'rename')
                Map('<leader>cd', vim.diagnostic.open_float, 'diagnostic under cursor')
                Map('K', vim.lsp.buf.hover, 'hover')

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local servers = {
            lua_ls = {},

            clangd = {
                cmd = {
                    'clangd',
                    '--clang-tidy',
                },
            },

            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                                ignore = { 'E501' },
                                maxLineLength = 120,
                            },
                        },
                    }
                },
            },

            cmake = {},

            glsl_analyzer = {},

            html = {},

            ts_ls = {},

            angularls = {},

            csharp_ls = {},
        }

        require('mason').setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {})
        require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

        require('mason-lspconfig').setup({
            ensure_installed = ensure_installed,
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end
            }
        })

        vim.diagnostic.config({ virtual_text = true })
    end,
}
