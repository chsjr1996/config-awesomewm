local awful = require("awful")
local wibox = require("wibox")

local function vtasklist(screen)
    return awful.widget.tasklist {
        screen  = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        layout  = {
            spacing = 5,
            layout  = wibox.layout.fixed.vertical,
        },
        style = {
            icon_size = 15,
        },
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        },
        widget_template = {
            {
                {
                    id     = "icon_role",
                    widget = wibox.widget.imagebox,
                },
                top    = 5,
                left   = 10,
                right  = 10,
                bottom = 5,
                widget = wibox.container.margin
            },
            id     = "background_role",
            widget = wibox.container.background,
        },
    }
end

return vtasklist

