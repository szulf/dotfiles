function Nmap(key, action, opts)
  vim.keymap.set('n', key, action, opts)
end

function Imap(key, action, opts)
  vim.keymap.set('i', key, action, opts)
end

function Cmap(key, action, opts)
  vim.keymap.set('c', key, action, opts)
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

vim.opt.wrap = false

Nmap('<C-d>', '<C-d>zz')
Nmap('<C-u>', '<C-u>zz')

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end
})

-- vim.api.nvim_create_autocmd('InsertEnter', {
--   callback = function()
--     vim.opt.iskeyword:append('_')
--   end
-- })
--
-- vim.api.nvim_create_autocmd('InsertLeavePre', {
--   callback = function()
--     vim.opt.iskeyword:remove('_')
--   end
-- })
--
-- vim.opt.iskeyword:remove('_')
-- Nmap('*',
-- function()
--   vim.opt.iskeyword:append('_')
--   vim.cmd('silent! normal! *')
--   vim.opt.iskeyword:remove('_')
-- end)

Nmap('<leader>m', function() vim.cmd('make') end)
Nmap('<leader>pt', function() vim.cmd('grep -e TODO -e NOTE -e IMPORTANT') end)

Nmap('<leader>wh', '<C-w><C-h>')
Nmap('<leader>wj', '<C-w><C-j>')
Nmap('<leader>wk', '<C-w><C-k>')
Nmap('<leader>wl', '<C-w><C-l>')
Nmap('<leader>ws', '<C-w><C-s>')
Nmap('<leader>wv', '<C-w><C-v>')
Nmap('<leader>wq', '<C-w><C-q>')

local makes = {
  ['/home/szulf/projects/handmade-hero'] = './build.sh',
  ['C:\\Users\\szymo\\projects\\handmade-hero'] = '.\\build.bat',
  ['/home/szulf/projects/game'] = 'cmake --build build -j 8',
}

local cwd = vim.fn.getcwd()
if makes[cwd] ~= nil then
  vim.opt.makeprg = makes[cwd]
end

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = 'powershell.exe'
  vim.opt.shellcmdflag = [[-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';]]
  vim.opt.shellxquote = ''
end

Nmap('<leader>qp', function() vim.cmd('cprev') end)
Nmap('<leader>qn', function() vim.cmd('cnext') end)
Nmap('<leader>qo', function() vim.cmd('copen') end)
Nmap('<leader>qc', function() vim.cmd('cclose') end)

Nmap('<leader>s', '<C-^>')

if cwd == '/home/szulf/projects/game' then
  vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local filetype = vim.bo.filetype
    -- TODO(szulf) : how do i check if a file is actually modified
    if mode == 'n' then
      if filetype == 'cpp' or filetype == 'c' or filetype == 'glsl' then
        vim.cmd('silent !clang-format -i %')
      elseif filetype == 'markdown' then
        vim.cmd('silent !prettier -w %')
      end
    end
  end
  })
end

require('config.lazy')

local function create_highlight_groups()
  vim.api.nvim_set_hl(0, 'MyTODO', { fg = '#FF0000', bold = true })
  vim.api.nvim_set_hl(0, 'MyNOTE', { fg = '#00FF00', bold = true })
  vim.api.nvim_set_hl(0, 'MyIMPORTANT', { fg = '#FFFF00', bold = true })
  vim.api.nvim_set_hl(0, 'MyAUTHOR', { fg = '#FFFFFF', italic = true })
end

local function apply_todo_highlights()
  if vim.w.todo_highlights_applied then return end
  vim.fn.matchadd('MyTODO', [[\<TODO\>]])
  vim.fn.matchadd('MyNOTE', [[\<NOTE\>]])
  vim.fn.matchadd('MyIMPORTANT', [[\<IMPORTANT\>]])
  vim.fn.matchadd('MyAUTHOR', [[\v(TODO|NOTE|IMPORTANT)\(\zs\w+\ze\):]])
  vim.w.todo_highlights_applied = true
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = create_highlight_groups,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = apply_todo_highlights,
})

create_highlight_groups()
apply_todo_highlights()

