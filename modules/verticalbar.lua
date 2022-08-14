local awful               = require("awful")
local wibox               = require("wibox")

local theme               = require("theme")

local widget_separator    = require("widgets.separator")

-- Left widgets
local widget_launcher     = require("widgets.launcher")
local widget_taglist      = require("widgets.taglist")

-- Right widgets (top-down of the bar)
local widget_tray         = require("widgets.tray")
local widget_microphone   = require("widgets.microphone")
local widget_volume       = require("widgets.volume")
local widget_brightness   = require("widgets.brightness")
local widget_memory       = require("widgets.memory")
local widget_cpu          = require("widgets.cpu")
local widget_fan          = require("widgets.fan")
local widget_layoutbox    = require("widgets.layoutbox")

local function verticalbar(s)
    s.verticalbar    = awful.wibar {
        position     = "left",
        align        = "bottom",
        screen       = s,
        width        = theme.bars_size,
        height       = s.geometry.height,
        bg           = theme.bars_bg,
        widget       = {
            layout = wibox.layout.align.vertical,
            { -- Left widgets
                layout = wibox.layout.fixed.vertical,
                widget_launcher(),
                widget_separator(),
                widget_taglist(s, true),
            },
            { -- Right widgets
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 20,
                    widget_layoutbox(s, true),
                    widget_fan(),
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
                    widget_tray(),
                },
                direction = "east",
                widget = wibox.container.rotate,
            },
        }
    }
end

return verticalbar

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
