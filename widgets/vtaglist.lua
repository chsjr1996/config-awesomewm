local awful = require("awful")
local wibox = require("wibox")

local function vtaglist(screen)
    return awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        layout  = wibox.layout.fixed.vertical,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        },
        widget_template = {
            id     = 'text_role',
            align  = "center",
            widget = wibox.widget.textbox,
        },
    }
end

return vtaglist

