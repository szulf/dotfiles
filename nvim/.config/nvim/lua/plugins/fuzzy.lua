return {
  'https://github.com/ctrlpvim/ctrlp.vim',

  opts = {},

  config = function()
    vim.g.ctrlp_show_hidden = true
    vim.g.ctrlp_by_filename = true
    vim.opt.wildignore:append({ '.git', 'build', 'vendor', '.cache' })

    Nmap('<leader>f', function() vim.cmd('CtrlP') end)
  end,
}
