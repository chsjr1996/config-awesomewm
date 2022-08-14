local awful  = require("awful")
local wibox  = require("wibox")
local faicon = require("widgets.common.faicon")

local function circle_icon_widget()
    local fa_widget = faicon.fa_widget()
    fa_widget:set_markup_silently(faicon.fa_markup('\u{f111}', '#ff000'))
    return fa_widget
end

local function taglist(screen, vertical)
    local taglistlayout = vertical
        and wibox.layout.fixed.vertical
        or wibox.layout.fixed.horizontal

    return awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        layout  = taglistlayout,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ Modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ Modkey }, 3, function(t)
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
            widget = wibox.widget.textbox
        },
    }
end

return taglist

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
