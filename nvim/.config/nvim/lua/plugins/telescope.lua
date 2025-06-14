return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require('telescope.actions').move_selection_next,
          ["<C-k>"] = require('telescope.actions').move_selection_previous,
        },
      },

      file_ignore_patterns = {
        'build/',
        '.git/',
      },
    },

    pickers = {
      find_files = {
        hidden = true,
      },

      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end
      },

    },
  },

  config = function(_, opts)
    require('telescope').setup(opts)

    local builtin = require('telescope.builtin')

    Map('<leader><leader>', builtin.find_files, 'find files in project')
    Map('<leader>pf', builtin.find_files, 'find files in project')
    Map('<leader>pg', builtin.live_grep, 'grep through project')
    Map('<leader>ps', builtin.lsp_workspace_symbols, 'symbols in project')
    Map('<leader>pm', builtin.marks, 'marks')
    Map('<leader>pt', function() vim.cmd('TodoTelescope') end, 'project todos')

    Map('<leader>bb', builtin.buffers, 'buffers list')
    Map('<leader>bk', function() vim.cmd('bdelete') end, 'kill buffer')
    Map('<leader>,', builtin.buffers, 'buffers list')

    Map('<leader>fs', builtin.lsp_document_symbols, 'symbols in file')

    Map('gd', builtin.lsp_definitions, 'lsp definitions')
    Map('gr', builtin.lsp_references, 'lsp references')
  end
}
