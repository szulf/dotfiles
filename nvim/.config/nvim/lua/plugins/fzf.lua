return {
  "ibhagwan/fzf-lua",

  opts = {},

  config = function()
    local fzf = require('fzf-lua')

    Nmap('<leader>f', fzf.files)
    Nmap('<leader>g', fzf.live_grep)
  end
}
