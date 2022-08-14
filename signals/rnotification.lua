local awful = require("awful")
local rnotification = require("ruled.notification")

local theme = require("theme")

local position = Basic_theme_layout and 'top_right' or 'bottom_left'

rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
            width            = theme.notification_width,
            border_width     = theme.notification_border_width,
            border_color     = theme.notification_border_color,
            margin           = theme.notification_margin,
            position         = position,
        }
    }
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = theme.bg_urgent, fg = '#ffffff' }
    }
end)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
