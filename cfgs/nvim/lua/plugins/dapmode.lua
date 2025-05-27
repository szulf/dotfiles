return {
    'mfussenegger/nvim-dap',

    dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
    },

    config = function()
        local dap = require('dap')
        local ui = require("dapui")
        ui.setup()

        Map('<leader>db', dap.toggle_breakpoint, 'toggle breakpoint')
        Map('<leader>dc', dap.continue, 'continue')
        Map('<leader>di', dap.step_into, 'step into')
        Map('<leader>dn', dap.step_over, 'step over')

        dap.adapters.gdb = {
            type = 'executable',
            command = 'gdb',
            args = { '--interpreter=dap', '--eval-command', 'set print pretty on' }
        }

        dap.configurations.c = {
            {
                name = 'Launch',
                type = 'gdb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'gdb',
                request = 'attach',
                target = 'localhost:1234',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}'
            },
        }
        dap.configurations.cpp = dap.configurations.c

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end
}
