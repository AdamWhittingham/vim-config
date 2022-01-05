-- Only show the cursor in the active buffer
vim.cmd [[
au BufEnter * setlocal cursorline
au BufLeave * setlocal nocursorline
]]

require 'colorizer'.setup({'*'}, { names = false, mode = 'virtualtext' })
vim.cmd [[ au BufReadPost *.palette setlocal ft=palette ]]

-- Setup function for running commands in other tmux tabs
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
