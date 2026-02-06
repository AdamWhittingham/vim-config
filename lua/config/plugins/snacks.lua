local coolLines = {
  [[              ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
  [[              ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
  [[              ██╔████╔██║███████║█████╔╝ █████╗     ]],
  [[              ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
  [[              ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
  [[              ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
  [[                ██████╗ ██████╗  ██████╗ ██╗        ]],
  [[               ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
  [[               ██║     ██║   ██║██║   ██║██║        ]],
  [[               ██║     ██║   ██║██║   ██║██║        ]],
  [[               ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
  [[                ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
  [[          ███████╗████████╗██╗   ██╗███████╗███████╗]],
  [[          ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
  [[          ███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
  [[          ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
  [[          ███████║   ██║   ╚██████╔╝██║     ██║     ]],
  [[          ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
}

local solveLines = {
  [[╔═╗┬┬─┐┌─┐┌┬┐  ┌─┐┌─┐┬ ┬  ┬┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┐ ┬  ┌─┐┌┬┐   ]],
  [[╠╣ │├┬┘└─┐ │   └─┐│ ││ └┐┌┘├┤    │ ├─┤├┤   ├─┘├┬┘│ │├┴┐│  ├┤ │││   ]],
  [[╚  ┴┴└─└─┘ ┴┘  └─┘└─┘┴─┘└┘ └─┘   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘└─┘┴─┘└─┘┴ ┴ o ]],
  [[      ╔╦╗┬ ┬┌─┐┌┐┌  ┬ ┬┬─┐┬┌┬┐┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┌┬┐┌─┐         ]],
  [[       ║ ├─┤├┤ │││  │││├┬┘│ │ ├┤    │ ├─┤├┤   │  │ │ ││├┤          ]],
  [[       ╩ ┴ ┴└─┘┘└┘  └┴┘┴└─┴ ┴ └─┘   ┴ ┴ ┴└─┘  └─┘└─┘─┴┘└─┘         ]],
  [[                                                     - John Johnson]]
}

local humourLines = {
  [[╔═╗┌─┐┌┬┐┌─┐  ┬┌─┐  ┬  ┬┬┌─┌─┐  ┬ ┬┬ ┬┌┬┐┌─┐┬─┐                           ]],
  [[║  │ │ ││├┤   │└─┐  │  │├┴┐├┤   ├─┤│ │││││ │├┬┘                           ]],
  [[╚═╝└─┘─┴┘└─┘  ┴└─┘  ┴─┘┴┴ ┴└─┘  ┴ ┴└─┘┴ ┴└─┘┴└─o                          ]],
  [[╦ ╦┬ ┬┌─┐┌┐┌  ┬ ┬┌─┐┬ ┬  ┬ ┬┌─┐┬  ┬┌─┐  ┌┬┐┌─┐  ┌─┐─┐ ┬┌─┐┬  ┌─┐┬┌┐┌  ┬┌┬┐]],
  [[║║║├─┤├┤ │││  └┬┘│ ││ │  ├─┤├─┤└┐┌┘├┤    │ │ │  ├┤ ┌┴┬┘├─┘│  ├─┤││││  │ │ ]],
  [[╚╩╝┴ ┴└─┘┘└┘   ┴ └─┘└─┘  ┴ ┴┴ ┴ └┘ └─┘   ┴ └─┘  └─┘┴ └─┴  ┴─┘┴ ┴┴┘└┘  ┴ ┴┘]],
  [[                                                        ┬┌┬┐┌─┐  ┌┐ ┌─┐┌┬┐]],
  [[                                                        │ │ └─┐  ├┴┐├─┤ ││]],
  [[                                                        ┴ ┴ └─┘  └─┘┴ ┴─┴┘]],
  [[                                                              - Cory House]],
}

local bugLines = {
  [[  _____   _                          _                 _                             ]],
  [[ |_   _| | |_    ___   _ _   ___    (_)  ___    __ _  | | __ __ __  __ _   _  _   ___]],
  [[   | |   | ' \  / -_) | '_| / -_)   | | (_-<   / _` | | | \ V  V / / _` | | || | (_-<]],
  [[   |_|   |_||_| \___| |_|   \___|   |_| /__/   \__,_| |_|  \_/\_/  \__,_|  \_, | /__/]],
  [[                                                                           |__/      ]],
  [[                                                   _                                 ]],
  [[  ___   _ _    ___     _ __    ___   _ _   ___    | |__   _  _   __ _                ]],
  [[ / _ \ | ' \  / -_)   | '  \  / _ \ | '_| / -_)   | '_ \ | || | / _` |               ]],
  [[ \___/ |_||_| \___|   |_|_|_| \___/ |_|   \___|   |_.__/  \_,_| \__, |               ]],
  [[                                                                |___/                ]],
  [[  _              __   _                                                              ]],
  [[ | |_   ___     / _| (_) __ __                                                       ]],
  [[ |  _| / _ \   |  _| | | \ \ /  _                                                    ]],
  [[  \__| \___/   |_|   |_| /_\_\ (_)                                     - Ellen Ullman]],
}

local fixLines = {
  [[    ┌─┐┬─┐ ┬  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┬ ┬┌─┐┌─┐      ]],
  [[    ├┤ │┌┴┬┘   │ ├─┤├┤   │  ├─┤│ │└─┐├┤       ]],
  [[    └  ┴┴ └─   ┴ ┴ ┴└─┘  └─┘┴ ┴└─┘└─┘└─┘┘     ]],
  [[╔╗╔╔═╗╔╦╗  ╔╦╗╦ ╦╔═╗  ╔═╗╦ ╦╔╦╗╔═╗╔╦╗╔═╗╔╦╗╔═╗]],
  [[║║║║ ║ ║    ║ ╠═╣║╣   ╚═╗╚╦╝║║║╠═╝ ║ ║ ║║║║╚═╗]],
  [[╝╚╝╚═╝ ╩    ╩ ╩ ╩╚═╝  ╚═╝ ╩ ╩ ╩╩   ╩ ╚═╝╩ ╩╚═╝]],
  [[                              - Steve Maguire ]],
}

local processLines = {
  [[╔╦╗╦ ╦╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╦╦  ╦╔═╗  ╔═╗╦═╗╔═╗╔═╗╔═╗╔═╗╔═╗]],
  [[ ║ ╠═╣║╣   ║  ╠╦╝║╣ ╠═╣ ║ ║╚╗╔╝║╣   ╠═╝╠╦╝║ ║║  ║╣ ╚═╗╚═╗]],
  [[ ╩ ╩ ╩╚═╝  ╚═╝╩╚═╚═╝╩ ╩ ╩ ╩ ╚╝ ╚═╝  ╩  ╩╚═╚═╝╚═╝╚═╝╚═╝╚═╝]],
  [[                     This is Amazing!                    ]],
  [[                    This is difficult                    ]],
  [[                      This is shit                       ]],
  [[                        I am shit                        ]],
  [[                     This might be OK                    ]],
  [[                     This is Amazing!                    ]],
}

local function lineColor(lines, popStart, popEnd)
  local out = {}
  for i, line in ipairs(lines) do
    local hi = "StartLogo" .. i
    if i > popStart and i <= popEnd then
      hi = "StartLogoPop" .. i - popStart
    elseif i > popStart then
      hi = "StartLogo" .. i - popStart
    else
      hi = "StartLogo" .. i
    end
    table.insert(out, { line.."\n",  hl = hi})
  end
  return out
end

local headers = {
  lineColor(coolLines, 6, 12),
  lineColor(solveLines, 0, 0),
  lineColor(humourLines, 6, 9),
  lineColor(bugLines, 5, 10),
  lineColor(processLines, 0, 3),
  lineColor(fixLines, 0, 0),
}


function header_chars()
  math.randomseed(os.time())
  return headers[math.random(#headers)]
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        formats = {
          key = function(item)
            return { { item.key, hl = "key" } }
          end,
        },
        preset ={
          header = header_chars()
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, limit = 9 },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
        scope = {
          hl = "IblScope",
        }
      },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
}
