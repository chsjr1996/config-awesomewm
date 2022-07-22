local ruled     = require("ruled")
local awful     = require("awful")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            border_width = beautiful.border_width,
            focus        = awful.client.focus.filter,
            raise        = true,
            screen       = awful.screen.preferred,
            placement    = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Gpick", "Gcolor3", "kitty-float", "Pavucontrol", "flameshot"
            },
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false      }
    }

    -- Bordeless clients
    ruled.client.append_rule {
          id         = "bordeless",
          rule_any   = {
              class    = {
                  "flameshot"
              },
          },
          properties = {
              border_width = 0,
          }
    }
end)

