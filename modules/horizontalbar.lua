local awful = require("awful")
local wibox = require("wibox")

local theme            = require("theme")

local widget_tasklist  = require("widgets.tasklist")
local widget_clock     = require("widgets.clock")

local function horizontalbar(s)
    local bars_size = theme.bars_size;
    local x_offset = bars_size;

    s.horizontalbar = awful.wibar {
        position = "top",
        align    = 'right',
        screen   = s,
        height   = bars_size,
        width    = s.geometry.width - x_offset,
        x        = s.geometry.x + x_offset,
        bg       = theme.bars_bg,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
            },
            {
                widget_tasklist(s), -- Middle widget
                margins = 5,
                widget = wibox.container.margin,
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                widget_clock(),
            },
        }
    }
end

return horizontalbar

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
