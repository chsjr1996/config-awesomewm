local spawn = require("awful.spawn")
local wibox = require("wibox")

local theme          = require("theme")
local commonsettings = require("utils.commonsettings")
local changecursor   = require("signals.changecursor")

local popupApp = os.getenv("HOME") .. "/.scripts/kitty-float.sh --interactive Calendar calcurse"

local function clock_signals(widget)
    widget:connect_signal("button::press", function()
        spawn(popupApp, commonsettings.centered_medium_client)
    end)
end

local function widget_clock()
    local clockmargin     = wibox.container.margin()
    local clockbackground = wibox.widget.background()
    local clockbgcolor    = Basic_theme_layout and "#000000" or theme.accent
    local clockfgcolor    = Basic_theme_layout and "#ffffff" or "#000000"

    local textclock = wibox.widget.textclock('<b>%H:%M</b>')
    textclock.font  = "sans 12"

    clock_signals(clockmargin)
    changecursor(clockbackground)

    clockmargin:set_margins(10)
    clockmargin:set_widget(textclock)

    clockbackground:set_widget(clockmargin)
    clockbackground:set_bg(clockbgcolor)
    clockbackground:set_fg(clockfgcolor)

    return clockbackground
end

return widget_clock

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
