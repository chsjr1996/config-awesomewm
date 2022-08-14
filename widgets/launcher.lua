local awful = require("awful")
local wibox = require("wibox")

local theme             = require("theme")
local changewiboxcursor = require("utils.changewiboxcursor")

-- TODO: move to globals config file
local launcher_command = os.getenv("HOME").."/.config/rofi/launchers/apps.sh"
local icon_path        = os.getenv("HOME").."/.config/awesome/theme/icons/arch-logo-black.png"

local function launcher_signals(widget)
    widget:connect_signal("mouse::enter", function()
        changewiboxcursor("hand2")
    end)

    widget:connect_signal("mouse::leave", function()
        changewiboxcursor(nil)
    end)
end

local function widget_launcher()
    local launcherwidgetmargin     = wibox.container.margin()
    local launcherwidgetbackground = wibox.container.background()

    local launcherwidget = awful.widget.launcher({
        image         = icon_path,
        command       = launcher_command,
    })

    launcherwidgetmargin:set_margins(5)
    launcherwidgetmargin:set_widget(launcherwidget)

    launcherwidgetbackground:set_widget(launcherwidgetmargin)
    launcherwidgetbackground:set_bg(theme.accent)

    launcher_signals(launcherwidgetmargin)

    return launcherwidgetbackground
end

return widget_launcher

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
