function Nmap(key, action)
  vim.keymap.set('n', key, action)
end

function Imap(key, action)
  vim.keymap.set('i', key, action)
end

function Cmap(key, action)
  vim.keymap.set('c', key, action)
end

local function get_filename_from_path(path)
  return path:match("^.+[\\/](.+)$") or path
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

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.opt.iskeyword:append('_')
  end
})

vim.api.nvim_create_autocmd('InsertLeavePre', {
  callback = function()
    vim.opt.iskeyword:remove('_')
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end
})

vim.opt.iskeyword:remove('_')
Nmap('*',
function()
  vim.opt.iskeyword:append('_')
  vim.cmd('silent! normal! *')
  vim.opt.iskeyword:remove('_')
end)

Nmap('<leader>m', function() vim.cmd('make') end)
Nmap('<leader>pt', ':Telescope live_grep<CR>TODO|NOTE|IMPORTANT')

local makes = {
  ['/home/szulf/projects/handmade-hero'] = './build.sh',
  ['C:\\Users\\szymo\\projects\\handmade-hero'] = '.\\build.bat',
  ['/home/szulf/projects/game'] = './build.sh',
}

local cwd = vim.fn.getcwd()
if makes[cwd] ~= nil then
  vim.opt.makeprg = makes[cwd]
end

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'}, {
  callback = function()
    local red = vim.api.nvim_get_hl(0, { name = 'GruvboxRed' }).fg
    local green = vim.api.nvim_get_hl(0, { name = 'GruvboxGreen' }).fg
    local yellow = vim.api.nvim_get_hl(0, { name = 'GruvboxYellow' }).fg

    vim.cmd([[ syntax match MyTODO /\<TODO\>/ ]])
    vim.api.nvim_set_hl(0, 'MyTODO', { bg = red, bold = true, })

    vim.cmd([[ syntax match MyNOTE /\<NOTE\>/ ]])
    vim.api.nvim_set_hl(0, 'MyNOTE', { bg = green, bold = true, })

    vim.cmd([[ syntax match MyIMPORTANT /\<IMPORTANT\>/ ]])
    vim.api.nvim_set_hl(0, 'MyIMPORTANT', { bg = yellow, bold = true, })
  end
})

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = 'powershell.exe'
  vim.opt.shellcmdflag = [[-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';]]
  vim.opt.shellxquote = ''
end

Nmap('<leader>bk', function() vim.cmd('bd') end)

require('config.lazy')
