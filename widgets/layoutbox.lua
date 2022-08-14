local awful = require("awful")
local wibox = require("wibox")

local theme             = require("theme")
local changewiboxcursor = require("utils.changewiboxcursor")

local function layoutbox_signals(widget)
    widget:connect_signal("mouse::enter", function()
        changewiboxcursor("hand2")
    end)

    widget:connect_signal("mouse::leave", function()
        changewiboxcursor(nil)
    end)
end

local function widget_layoutbox(s, rotate)
    local layoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    local layoutboxrotate     = wibox.container.rotate()
    local layoutboxmargins    = wibox.container.margin()
    local layoutboxbackground = wibox.container.background()

    if rotate == true then
        layoutboxrotate:set_direction("west")
    end
    layoutboxrotate:set_widget(layoutbox)

    layoutbox_signals(layoutboxmargins)

    layoutboxmargins:set_margins(5)
    layoutboxmargins:set_widget(layoutboxrotate)

    layoutboxbackground:set_bg(theme.accent)
    layoutboxbackground:set_widget(layoutboxmargins)

    return layoutboxbackground
end

return widget_layoutbox

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
