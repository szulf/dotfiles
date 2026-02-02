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

vim.opt.number = true
vim.opt.relativenumber = true

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
    vim.highlight.on_yank()
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

-- THEME:
local function set_hl(names, value)
  for i, v in ipairs(names) do
    vim.api.nvim_set_hl(0, v, value)
  end
end

set_hl({ 'Visual', 'MatchParen' }, { bg = '#000058' })
set_hl({ 'Special' }, {})

local colors = {
  background  = "#181818",
  punctuation = "#93975a",
  string      = "#f99358",
  comment     = "#53d549",
  text        = "#fed8a7",
  selection   = "#000058",
  keyword     = "#b3969e",
  white       = "#b3969e",
  constant    = "#d9cace",
  error       = "#ff0000",
  warning     = "#ffaa00",
  highlight   = "#524743",
  line_fg     = "#72535c",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "naysayer"

set_hl({ 'Normal' }, { fg = colors.text, bg = colors.background })
set_hl({ 'Cursor' }, { bg = colors.white })
set_hl({ 'Visual' }, { bg = colors.selection })
set_hl({ 'LineNr' }, { fg = colors.line_fg, bg = colors.background })
set_hl({ "CursorLineNr" }, { fg = colors.white, bg = colors.background })
set_hl({ "CursorLine" }, { bg = colors.highlight })
set_hl({ "ColorColumn" }, { bg = colors.highlight })
set_hl({ "VertSplit" }, { fg = colors.line_fg })
set_hl({ "MatchParen" }, { bg = colors.selection })

set_hl({ "Comment" }, { fg = colors.comment })
set_hl({ "String" }, { fg = colors.string })
set_hl({ "Number" }, { fg = colors.constant })
set_hl({ "Boolean" }, { fg = colors.constant })
set_hl({ "Constant" }, { fg = colors.constant })
set_hl({ 'Special' }, { fg = colors.delimiter })
set_hl({ "Operator" }, { fg = colors.constant })
set_hl({ "Identifier" }, { fg = colors.text })
set_hl({ "Function" }, { fg = colors.text })
set_hl({ "Statement" }, { fg = colors.keyword })
set_hl({ "Keyword" }, { fg = colors.keyword })
set_hl({ "Type" }, { fg = colors.punctuation })
set_hl({ "PreProc" }, { fg = colors.constant })
set_hl({ "WarningMsg" }, { fg = colors.warning })
set_hl({ "Error" }, { fg = colors.error })

set_hl({ "@comment" }, { link = "Comment" })
set_hl({ "@string" }, { link = "String" })
set_hl({ "@number" }, { link = "Number" })
set_hl({ "@boolean" }, { link = "Boolean" })
set_hl({ "@constant" }, { link = "Constant" })
set_hl({ "@function" }, { link = "Function" })
set_hl({ "@function.builtin" }, { link = "Function" })
set_hl({ "@variable" }, { link = "Identifier" })
set_hl({ "@type" }, { link = "Type" })
set_hl({ "@keyword" }, { link = "Keyword" })
set_hl({ "@keyword.function" }, { link = "Keyword" })
set_hl({ "@field" }, { link = "Identifier" })
set_hl({ "@property" }, { link = "Identifier" })
set_hl({ "@parameter" }, { link = "Identifier" })

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

