local awful               = require("awful")
local wibox               = require("wibox")

-- Left widgets
local widget_vtaglist     = require("widgets.vtaglist")

-- Middle widgets
local widget_vtasklist    = require("widgets.vtasklist")

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

local function verticalbar(screen)
    screen.verticalbar    = awful.wibar {
        position     = "left",
        screen       = screen,
        width        = 35,
        bg           = "#000000",
        widget       = {
            layout = wibox.layout.align.vertical,
            { -- Left widgets
                layout = wibox.layout.fixed.vertical,
                widget_vtaglist(screen),
            },
            -- Middle widget
            widget_vtasklist(screen),
            { -- Right widgets
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 8,
                    {
                        widget_layoutbox(screen),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_clock(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_fan(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_cpu(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_memory(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_brightness(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_volume(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        widget_microphone(),
                        direction = "west",
                        widget = wibox.container.rotate,
                    },
                    {
                        wibox.widget.systray(),
                        margins = 5,
                        widget = wibox.container.margin,
                    },
                },
                direction = "east",
                widget = wibox.container.rotate,
            },
        }
    }
end

return verticalbar

