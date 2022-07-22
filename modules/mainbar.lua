local awful               = require("awful")
local wibox               = require("wibox")

-- Left widgets
local widget_taglist      = require("widgets.taglist")
local widget_promptbox    = require("widgets.promptbox")

-- Middle widgets
local widget_tasklist     = require("widgets.tasklist")

-- Right widgets
-- local widget_notification = require("widgets.notification")
local widget_microphone   = require("widgets.microphone")
local widget_volume       = require("widgets.volume")
local widget_brightness   = require("widgets.brightness")
local widget_memory       = require("widgets.memory")
local widget_cpu          = require("widgets.cpu")
local widget_fan          = require("widgets.fan")
local widget_clock        = require("widgets.clock")
local widget_layoutbox    = require("widgets.layoutbox")

local function mainbar(screen)
    screen.widget_promptbox = widget_promptbox()

    screen.mainbar = awful.wibar {
        position = "top",
        screen   = screen,
        height   = 35,
        bg       = '#00000000',
        widget   = {
          layout = wibox.container.margin,
          top = 10,
          left = 10,
          right = 10,
          {
            widget = wibox.container.background,
            bg     = '#000000',
            {
              layout = wibox.layout.align.horizontal,
              { -- Left widgets
                  layout = wibox.layout.fixed.horizontal,
                  widget_taglist(screen),
                  screen.widget_promptbox,
              },
              -- Middle widget
              widget_tasklist(screen),
              { -- Right widgets
                  layout = wibox.layout.fixed.horizontal,
                  -- widget_notification(),
                  wibox.widget.systray(),
                  widget_microphone(),
                  widget_volume(),
                  widget_brightness(),
                  widget_memory(),
                  widget_cpu(),
                  widget_fan(),
                  widget_clock(),
                  widget_layoutbox(screen),
              },
            }
          }
        }
    }
end

return mainbar

