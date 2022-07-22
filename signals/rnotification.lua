local rnotification = require("ruled.notification")
local awful = require("awful")
local theme = require("themes.default.theme")

rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
            width            = theme.notification_width,
            border_width     = theme.notification_border_width,
            margin           = theme.notification_margin,
            position         = 'bottom_left',
        }
    }
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = theme.bg_urgent, fg = '#ffffff' }
    }
end)

