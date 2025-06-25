function Nmap(key, action)
  vim.keymap.set('n', key, action)
end

function Imap(key, action)
  vim.keymap.set('i', key, action)
end

function Cmap(key, action)
  vim.keymap.set('c', key, action)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.scrolloff = 10
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '> ' }

vim.opt.showmode = true

vim.opt.termguicolors = true
vim.opt.guicursor = ''

vim.opt.inccommand = 'split'

vim.opt.colorcolumn = '101'

vim.opt.hlsearch = true
Nmap('<Esc>', function() vim.cmd('nohlsearch') end)

vim.opt.wildmenu = true

vim.o.clipboard = 'unnamedplus'

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
Nmap('<leader>fd', function() vim.cmd('Ex') end)

vim.o.path = vim.o.path .. "**"

Nmap('<leader>wh', '<C-w><C-h>')
Nmap('<leader>wj', '<C-w><C-j>')
Nmap('<leader>wk', '<C-w><C-k>')
Nmap('<leader>wl', '<C-w><C-l>')
Nmap('<leader>wv', '<C-w><C-v>')
Nmap('<leader>ws', '<C-w><C-s>')
Nmap('<leader>wq', '<C-w><C-q>')

Nmap('<C-d>', '<C-d>zz')
Nmap('<C-u>', '<C-u>zz')

Nmap('<C-j>', '<C-n>')
Nmap('<C-k>', '<C-p>')
Imap('<C-j>', '<C-n>')
Imap('<C-k>', '<C-p>')
Cmap('<C-j>', '<C-n>')
Cmap('<C-k>', '<C-p>')

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.opt.iskeyword:remove('_')
Nmap('*',
function()
  vim.opt.iskeyword:append('_')
  vim.cmd('normal! *')
  vim.opt.iskeyword:remove('_')
end)

Nmap('<leader><leader>', ':find ')
Nmap('<leader>fe', ':e ')
Nmap('<leader>pg', ':grep ')
Nmap('<leader>pc', function() vim.cmd('make') end)

local makes = {
  ['/home/szulf/projects/handmade-hero'] = './build.sh'
}

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local path = vim.fn.expand("%:p:h")
    for k, v in pairs(makes) do
      if path == k then
        vim.opt.makeprg = v
      end
    end
  end
})

local function set_my_todos()
    vim.cmd([[ syn match myTodos /\%(TODO\)\|\%(NOTE\)/ ]])
    vim.cmd([[ hi link myTodos Todo ]])
end

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'}, {
  callback = function()
    set_my_todos()
  end
})

require('config.lazy')
