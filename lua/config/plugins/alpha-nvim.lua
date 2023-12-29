local coolLines = {
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

local solveLines = {
[[╔═╗┬┬─┐┌─┐┌┬┐  ┌─┐┌─┐┬ ┬  ┬┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┐ ┬  ┌─┐┌┬┐   ]],
[[╠╣ │├┬┘└─┐ │   └─┐│ ││ └┐┌┘├┤    │ ├─┤├┤   ├─┘├┬┘│ │├┴┐│  ├┤ │││   ]],
[[╚  ┴┴└─└─┘ ┴┘  └─┘└─┘┴─┘└┘ └─┘   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘└─┘┴─┘└─┘┴ ┴ o ]],
[[╔╦╗┬ ┬┌─┐┌┐┌  ┬ ┬┬─┐┬┌┬┐┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┌┬┐┌─┐               ]],
[[ ║ ├─┤├┤ │││  │││├┬┘│ │ ├┤    │ ├─┤├┤   │  │ │ ││├┤                ]],
[[ ╩ ┴ ┴└─┘┘└┘  └┴┘┴└─┴ ┴ └─┘   ┴ ┴ ┴└─┘  └─┘└─┘─┴┘└─┘               ]],
[[ ]],
[[ - John Johnson]]
}

local humourLines = {
[[╔═╗┌─┐┌┬┐┌─┐  ┬┌─┐  ┬  ┬┬┌─┌─┐  ┬ ┬┬ ┬┌┬┐┌─┐┬─┐                           ]],
[[║  │ │ ││├┤   │└─┐  │  │├┴┐├┤   ├─┤│ │││││ │├┬┘                           ]],
[[╚═╝└─┘─┴┘└─┘  ┴└─┘  ┴─┘┴┴ ┴└─┘  ┴ ┴└─┘┴ ┴└─┘┴└─o                          ]],
[[╦ ╦┬ ┬┌─┐┌┐┌  ┬ ┬┌─┐┬ ┬  ┬ ┬┌─┐┬  ┬┌─┐  ┌┬┐┌─┐  ┌─┐─┐ ┬┌─┐┬  ┌─┐┬┌┐┌  ┬┌┬┐]],
[[║║║├─┤├┤ │││  └┬┘│ ││ │  ├─┤├─┤└┐┌┘├┤    │ │ │  ├┤ ┌┴┬┘├─┘│  ├─┤││││  │ │ ]],
[[╚╩╝┴ ┴└─┘┘└┘   ┴ └─┘└─┘  ┴ ┴┴ ┴ └┘ └─┘   ┴ └─┘  └─┘┴ └─┴  ┴─┘┴ ┴┴┘└┘  ┴ ┴┘]],
[[┬┌┬┐┌─┐  ┌┐ ┌─┐┌┬┐                                                        ]],
[[│ │ └─┐  ├┴┐├─┤ ││                                                        ]],
[[┴ ┴ └─┘  └─┘┴ ┴─┴┘o                                                       ]],
[[ - Cory House]],
}

local bugLines = {
[[ ______ __  __  ____ ____   ____    __  __      ___  __    __    __  ___  _  _  __ ]],
[[ | || | ||  || ||    || \\ ||       || (( \    // \\ ||    ||    || // \\ \\// (( \]],
[[   ||   ||==|| ||==  ||_// ||==     ||  \\     ||=|| ||    \\ /\ // ||=||  )/   \\ ]],
[[   ||   ||  || ||___ || \\ ||___    || \_))    || || ||__|  \V/\V/  || || //   \_))]],
[[                                                                                   ]],
[[   ___   __  __  ____    ___  ___   ___   ____   ____    ____  __ __   ___         ]],
[[  // \\  ||\ || ||       ||\\//||  // \\  || \\ ||       || )) || ||  // \\        ]],
[[ ((   )) ||\\|| ||==     || \/ || ((   )) ||_// ||==     ||=)  || || (( ___        ]],
[[  \\_//  || \|| ||___    ||    ||  \\_//  || \\ ||___    ||_)) \\_//  \\_||        ]],
[[                                                                                   ]],
[[ ______   ___       ____ __ _   _                                                  ]],
[[ | || |  // \\     ||    || \\ //                                                  ]],
[[   ||   ((   ))    ||==  ||  )X(                                                   ]],
[[   ||    \\_//     ||    || // \\ ||                                               ]],
[[ - Ellen Ullman]]
}

local function lineToStartGradient(lines)
  local out = {}
  for i, line in ipairs(lines) do
    table.insert(out, { hi = "StartLogo"..i, line = line})
  end
  return out
end

local function lineToReverseGradient(lines)
  local out = {}
  for i, line in ipairs(lines) do
    local index = 18 - i
    table.insert(out, { hi = "StartLogo"..index, line = line})
  end
  return out
end

local function linePopGradient(lines, popStart, popEnd)
  local out = {}
  for i, line in ipairs(lines) do
    local hi = "StartLogo" .. i
    if i <= popStart then
      hi = "StartLogo" .. i + popStart
    elseif i > popStart and i <= popEnd then
      hi = "StartLogoPop" .. i - popStart
    end
    table.insert(out, { hi = hi, line = line})
  end
  return out
end

local headers = {
  linePopGradient(coolLines, 6, 12),
  lineToReverseGradient(solveLines),
  lineToReverseGradient(humourLines),
  linePopGradient(bugLines, 5, 10),
}

local function header_chars()
  math.randomseed(os.time())
  return headers[math.random(#headers)]
end

-- Map over the headers, setting a different color for each line.
-- This is done by setting the Highligh to StartLogoN, where N is the row index.
-- Define StartLogo1..StartLogoN to get a nice gradient.
local function header_color()
  local lines = {}
  for _, lineConfig in pairs(header_chars()) do
    local hi = lineConfig.hi
    local line_chars = lineConfig.line
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

local function configure()
  local theme = require("alpha.themes.theta")
  local themeconfig = theme.config
  local dashboard = require("alpha.themes.dashboard")
  local buttons = {
    type = "group",
    val = {
      { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1 },
      dashboard.button("e", "  New file", "<cmd>ene<CR>"),
      dashboard.button("SPC f", "  Find file"),
      dashboard.button("SPC F", "  Find text"),
      dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
      dashboard.button("t", "  Install language tools", "<cmd>Mason<CR>"),
      dashboard.button("q", "󰩈  Quit", "<cmd>qa<CR>"),
    },
    position = "center",
  }

  themeconfig.layout[2] = header_color()
  themeconfig.layout[6] = buttons

  return themeconfig
end

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require'alpha'.setup(configure())
  end
};
