local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

local has_dapui, dapui = pcall(require, "dapui")
if not has_dapui then
  return
end

local dapui_config = {
  layouts = {
    {
      elements = {
        'repl',
        'scopes',
      },
      size = 10,
      position = 'bottom',
    },
    {
      elements = {
        'stacks',
        'breakpoints',
        'watches',
      },
      size = 40,
      position = 'left',
    },
  },
  controls = {
    element = "scopes"
  }
}

require("dapui").setup(dapui_config)
require("nvim-dap-virtual-text").setup()
require('telescope').load_extension('dap')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint'})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointConditional', linehl='', numhl='DapBreakpointConditional'})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected', linehl='', numhl='DapBreakpointRejected'})
vim.fn.sign_define('DapStopped', {text='', texthl='DapStopped', linehl='DapStoppedLine', numhl='DapStopped'})
