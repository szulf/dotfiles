return {
    'ibhagwan/fzf-lua',

    opts = { 'ivy' },

    config = function(_, opts)
        local fzf = require('fzf-lua')
        fzf.setup(opts)

        Map('<leader><leader>', fzf.files, 'find files')
        Map('<leader>pf', fzf.files, 'find files')
        Map('<leader>pg', fzf.live_grep, 'grep through files')
        Map('<leader>pd', fzf.diagnostics_workspace, 'diagnostics')

        Map('gr', fzf.lsp_references, 'lsp references')
        Map('gd', fzf.lsp_definitions, 'lsp definitions')
        Map('gD', fzf.lsp_declarations, 'lsp declarations')
        Map('<leader>cq', fzf.quickfix, 'quickfix list')

        Map('<leader>bb', fzf.buffers, 'buffers')

        Map('<leader>ff', function() fzf.files({ cwd = '~' }) end, 'find global files')

        Map('<leader>dl', fzf.dap_breakpoints, 'list breakpoints')
    end
}
