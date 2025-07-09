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

vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_keepdir = 0
Nmap('<leader>fd', function() vim.cmd('Ex') end)

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
  ['/home/szulf/projects/handmade-hero'] = './build.sh',
  ['C:\\Users\\szymo\\projects\\handmade-hero'] = '.\\build.bat',
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

local function set_path(dirs, dir_name, blacklist_dirs)
  for _, dir in ipairs(vim.fn.readdir(dir_name)) do
    local absolute_dir = dir_name .. '/' .. dir
    if vim.fn.getftype(absolute_dir) == 'dir' and blacklist_dirs[dir] ~= true then
      table.insert(dirs, absolute_dir)
      vim.o.path = vim.o.path .. ',' .. absolute_dir
      set_path(dirs, absolute_dir, blacklist_dirs)
    end
  end
end

local blacklist_dirs = { ['build'] = true, ['.git'] = true }
vim.o.path = vim.o.path .. ',' .. vim.fn.getcwd()
local dirs = {}

vim.ui.input({ prompt = 'Recurse through directories? Y/N' }, function(input)
  if vim.fn.tolower(input) == 'y' then
    set_path(dirs, vim.fn.expand('%:p:h'), blacklist_dirs)
  end
end)
