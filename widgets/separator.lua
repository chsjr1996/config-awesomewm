local wibox = require("wibox")

local function widget_separator(spacing)
    return {
        margins = spacing or 5,
        widget = wibox.container.margin,
    }
end

return widget_separator

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
