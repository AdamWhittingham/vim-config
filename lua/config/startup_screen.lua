local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local cool = {
  [[    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
  [[    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
  [[    ██╔████╔██║███████║█████╔╝ █████╗     ]],
  [[    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
  [[    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
  [[    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
  [[      ██████╗ ██████╗  ██████╗ ██╗        ]],
  [[     ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
  [[     ██║     ██║   ██║██║   ██║██║        ]],
  [[     ██║     ██║   ██║██║   ██║██║        ]],
  [[     ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
  [[      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
  [[███████╗████████╗██╗   ██╗███████╗███████╗]],
  [[██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
  [[███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
  [[╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
  [[███████║   ██║   ╚██████╔╝██║     ██║     ]],
  [[╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
}

local robust = {
  [[        ██████╗ ██╗   ██╗██╗██╗     ██████╗         ]],
  [[        ██╔══██╗██║   ██║██║██║     ██╔══██╗        ]],
  [[        ██████╔╝██║   ██║██║██║     ██║  ██║        ]],
  [[        ██╔══██╗██║   ██║██║██║     ██║  ██║        ]],
  [[        ██████╔╝╚██████╔╝██║███████╗██████╔╝        ]],
  [[        ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝         ]],
  [[ ██████╗  ██████╗ ██████╗ ██╗   ██╗███████╗████████╗]],
  [[ ██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝]],
  [[ ██████╔╝██║   ██║██████╔╝██║   ██║███████╗   ██║   ]],
  [[ ██╔══██╗██║   ██║██╔══██╗██║   ██║╚════██║   ██║   ]],
  [[ ██║  ██║╚██████╔╝██████╔╝╚██████╔╝███████║   ██║   ]],
  [[ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   ]],
  [[     ███████╗████████╗██╗   ██╗███████╗███████╗     ]],
  [[     ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝     ]],
  [[     ███████╗   ██║   ██║   ██║█████╗  █████╗       ]],
  [[     ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝       ]],
  [[     ███████║   ██║   ╚██████╔╝██║     ██║          ]],
  [[     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝          ]],
}

local headers = {cool, robust}

local function header_chars()
  math.randomseed(os.time())
  return headers[math.random(#headers)]
end

-- Map over the headers, setting a different color for each line.
-- This is done by setting the Highligh to StartLogoN, where N is the row index.
-- Define StartLogo1..StartLogoN to get a nice gradient.
local function header_color()
  local lines = {}
  for i, line_chars in pairs(header_chars()) do
    local hi = "StartLogo" .. i
    local line = {
      type = "text",
      val = line_chars,
      opts = {
        hl = hi,
        shrink_margin = false,
        position = "center",
      },
    }
    table.insert(lines, line)
  end

  local output = {
    type = "group",
    val = lines,
    opts = { position = "center", },
  }

  return output
end

local config = require("alpha.themes.theta").config
config.layout[2] = header_color()
alpha.setup(config)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "Alpha",
  callback = function()
    vim.b.minicursorword_disable = true
    vim.b.miniindentscope_disable = true
  end,
})
