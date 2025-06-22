return {
  'igemnace/vim-makery',

  lazy = false,

  config = function()
    vim.g.makery_config = {
      ['~/projects/dotfiles'] = {
        build = { makeprg = 'dotfiles.sh' }
      },

      ['~/projects/interpreter-in-cpp'] = {
        build = { makeprg = 'cmake --build build' }
      },

      ['~/projects/handmade-hero'] = {
        build = { makeprg = './build.sh' }
      },

      ['~/installs/4coder'] = {
        build = { makeprg = './build.sh' }
      },

      ['~/projects/game'] = {
        build = { makeprg = './build.sh' }
      },
    }

    Map('<leader>pc', function() vim.cmd('Mbuild') end, 'build the current project')
  end
}
