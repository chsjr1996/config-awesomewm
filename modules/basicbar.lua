local awful               = require("awful")
local wibox               = require("wibox")

local theme               = require("theme")
local shape               = require("utils.shape")

-- widgets
local widget_separator    = require("widgets.separator")
-- Left widgets
local widget_launcher     = require("widgets.launcher")
local widget_taglist      = require("widgets.taglist")
local widget_promptbox    = require("widgets.promptbox")
-- Center widgets
local widget_clock        = require("widgets.clock")
-- Right widgets
-- local widget_notification = require("widgets.notification")
local widget_microphone   = require("widgets.microphone")
local widget_volume       = require("widgets.volume")
local widget_brightness   = require("widgets.brightness")
local widget_memory       = require("widgets.memory")
local widget_cpu          = require("widgets.cpu")
local widget_fan          = require("widgets.fan")
local widget_layoutbox    = require("widgets.layoutbox")

local function basicbar(s)
    s.widget_promptbox = widget_promptbox()

    s.horizontalbar  = awful.wibar {
        position     = "top",
        align        = "bottom",
        screen       = s,
        height       = theme.bars_size,
        bg           = theme.bars_bg,
        margins      = {
            top   = 10,
            left  = 10,
            right = 10,
        },
        shape        = shape.rounded_shape,
        widget       = {
            layout = wibox.layout.stack,
            {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    widget_separator(),
                    widget_taglist(s),
                    widget_separator(),
                    s.widget_promptbox,
                },
                nil,
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 10,
                    {
                        wibox.widget.systray(),
                        margins = 5,
                        widget = wibox.container.margin,
                    },
                    widget_microphone(),
                    widget_volume(),
                    widget_brightness(),
                    widget_memory(),
                    widget_cpu(),
                    widget_fan(),
                    widget_layoutbox(s),
                },
            },
            { -- Center widgets
                layout = wibox.container.place,
                valign = "center",
                halign = "center",
                widget_clock(),
            },
        }
    }
end

return basicbar

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
