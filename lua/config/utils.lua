-- Only show the cursor in the active buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  command = "setlocal cursorline",
  desc = "Show cursor in active pane",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = "*",
  command = "setlocal nocursorline",
  desc = "Hide cursor in inactive pane",
})

-- Switch.vim customisation
vim.cmd(
  [[
  let g:switch_custom_definitions = [
  \  ['proposed', 'accepted', 'superceded', 'rejected']
  \]
  ]]
)
-----

function _G.set_mark()
  print("Set mark: ")
  local mark = vim.fn.getcharstr()
  vim.api.nvim_command(":mark "..mark)
  print("Set mark: " .. mark)
end

local show_diagnotic_virtual_text = false

function _G.toggle_diagnostics()
  if show_diagnotic_virtual_text then
    vim.diagnostic.config({virtual_text = false})
    show_diagnotic_virtual_text = false
  else
    vim.diagnostic.config({virtual_text = true})
    show_diagnotic_virtual_text = true
  end
end

function _G.translate()
  local mode = vim.api.nvim_get_mode().mode;
  vim.ui.input({prompt = "Translate into (2 letter ISO code): "}, function(input)
    if mode == "v" or mode == "V" then
      vim.cmd("'<,'>Translate -output=replace " .. input)
    else
      vim.cmd("Translate -output=replace " .. input)
    end
  end)
end

-- Setup function for running commands in other tmux tabs
vim.cmd [[
function! InvokeInTestTab(cmd)
  let l:targetWindow = trim(system('tmux list-windows | grep "test" | cut -f1 -d":" | head -1'))
  if empty(l:targetWindow)
    let l:targetWindow = 3
  endif
  let l:target = "-t " . l:targetWindow . ".1"
  let l:command = "tmux send-keys" . " " . l:target . ' "' . a:cmd . '" Enter'
  echom "Running in window " . l:targetWindow
  let output = system(l:command)
endfunction
]]

vim.cmd [[
function! InvokeViaTmux(cmd, test)
  let l:targetWindow = trim(system('tmux list-windows | grep "test" | cut -f1 -d":" | head -1'))
  if empty(l:targetWindow)
    let l:targetWindow = 3
  endif
  let l:target = "-t " . l:targetWindow . ".1"
  let l:command = "tmux send-keys" . " " . l:target . ' "' . a:cmd . " "  . a:test . '" Enter'
  echom "Running " . a:test . " in window " . l:targetWindow
  let output = system(l:command)
endfunction
]]
