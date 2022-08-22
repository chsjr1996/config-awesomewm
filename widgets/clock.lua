local awful = require("awful")
local spawn = require("awful.spawn")
local wibox = require("wibox")

local theme          = require("theme")
local changecursor   = require("signals.changecursor")
local notify         = require("utils.notify")

local notification = nil

local function add_clock_buttons(widget)
    widget:buttons(
      awful.util.table.join(
        awful.button({}, 1, function ()
            notification = notify(notification, "Date", os. date ("%A, %d %B %Y"), "top_center")
            notification:connect_signal('destroyed', function(reason, keep_alive)
                notification = nil
            end)
        end),
        awful.button({}, 3, function ()
            spawn(Calendar_popup_app)
        end)
      )
    )
end

local function widget_clock()
    local clockmargin     = wibox.container.margin()
    local clockbackground = wibox.widget.background()
    local clockbgcolor    = Basic_theme_layout and "#000000" or theme.accent
    local clockfgcolor    = Basic_theme_layout and "#ffffff" or "#000000"

    local textclock = wibox.widget.textclock('<b>%H:%M</b>')
    textclock.font  = "sans 12"

    clockmargin:set_margins(10)
    clockmargin:set_widget(textclock)
    clockbackground:set_widget(clockmargin)
    clockbackground:set_bg(clockbgcolor)
    clockbackground:set_fg(clockfgcolor)

    add_clock_buttons(clockbackground)
    changecursor(clockbackground)

    return clockbackground
end

return widget_clock

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
