local has_daprb, daprb = pcall(require, "dap-ruby")
if has_daprb then
  daprb.setup()
end
