return {
    'igemnace/vim-makery',

    lazy = false,

    config = function()
        vim.g.makery_config = {
            ['~/projects/botman'] = {
                build = { makeprg = 'cmake --build build --config Debug' }
            },

            ['~/projects/dotfiles'] = {
                build = { makeprg = './dotfiles.sh' }
            },

            ['~/projects/interpreter-in-cpp'] = {
                build = { makeprg = 'cmake --build build' }
            },

            ['~/projects/opengl'] = {
                build = { makeprg = 'cmake --build build' }
            },
        }

        Map('<leader>mk', function() vim.cmd('Mbuild') end, 'build the current project')

        Map('<leader>mo', function()
            local quickfix_open = false
            for _, win in ipairs(vim.fn.getwininfo()) do
                if win["quickfix"] == 1 then
                    quickfix_open = true
                end
            end

            if quickfix_open then
                vim.cmd('cclose')
            else
                vim.cmd('copen')
            end
        end, 'Open the quickfix window')
    end
}
