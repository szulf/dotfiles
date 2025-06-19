vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'black' })
vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 8 })

vim.api.nvim_set_hl(0, 'Type', { ctermfg = 'yellow' })
vim.api.nvim_set_hl(0, '@type', { ctermfg = 'yellow' })
vim.api.nvim_set_hl(0, '@type.builtin', { ctermfg = 'yellow' })

vim.api.nvim_set_hl(0, 'Function', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@lsp.type.function', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@function', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@function.macro', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@function.method', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@function.builtin', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, '@function.method.call', { ctermfg = 'green' })

vim.api.nvim_set_hl(0, 'Keyword', { ctermfg = 'blue' })
vim.api.nvim_set_hl(0, '@lsp.type.keyword', { ctermfg = 'blue' })
vim.api.nvim_set_hl(0, '@keyword', { ctermfg = 'blue' })

vim.api.nvim_set_hl(0, 'Number', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@lsp.type.number', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@number', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@number.float', { ctermfg = 'red' })

vim.api.nvim_set_hl(0, 'Constant', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, '@constant', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, '@constant.builtin', { ctermfg = 'magenta' })

vim.api.nvim_set_hl(0, 'Error', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'DiagnosticError', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'NotificationError', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@comment.error', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@error', { ctermfg = 'red' })

vim.api.nvim_set_hl(0, 'String', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@lsp.type.string', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.escape', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.regexp', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.special', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.special.url', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.special.path', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@string.special.symbol', { ctermfg = 'red' })

vim.api.nvim_set_hl(0, 'Character', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, 'SpecialChar', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, '@character', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, '@character.special', { ctermfg = 'magenta' })

vim.api.nvim_set_hl(0, 'Boolean', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, '@boolean', { ctermfg = 'red' })

vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 8 })
vim.api.nvim_set_hl(0, 'SpecialComment', { ctermfg = 8 })
vim.api.nvim_set_hl(0, '@lsp.type.comment', { ctermfg = 8 })
vim.api.nvim_set_hl(0, '@comment', { ctermfg = 8 })

vim.api.nvim_set_hl(0, 'TodoBgFIX', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, 'TodoSignFIX', { ctermfg = 'magenta' })
vim.api.nvim_set_hl(0, 'TodoBgNOTE', { ctermfg = 'blue' })
vim.api.nvim_set_hl(0, 'TodoSignNOTE', { ctermfg = 'blue' })
vim.api.nvim_set_hl(0, 'TodoBgTODO', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'TodoSignTODO', { ctermfg = 'red' })

vim.api.nvim_set_hl(0, 'StatusLine', { ctermfg = 'white' })
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 8 })

vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 'black', ctermfg = 'white' })
vim.api.nvim_set_hl(0, 'PmenuSel', { ctermbg = 8 })

vim.api.nvim_set_hl(0, '@lsp.type.property', {})
vim.api.nvim_set_hl(0, '@property', {})

return {}
