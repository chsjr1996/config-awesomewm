local awful        = require("awful")
local volumechange = require("utils.volumechange")
local brightchange = require("utils.brightchange")

local function systembinds()
    awful.keyboard.append_global_keybindings({
        -- Volume binds
        awful.key({}, "XF86AudioRaiseVolume",
            function()
                volumechange("+")
            end,
            {description = "increase volume", group = "system"}),
        awful.key({}, "XF86AudioLowerVolume",
            function()
                volumechange("-")
            end,
            {description = "decrease volume", group = "system"}),
        awful.key({ Modkey }, "Up",
            function()
                volumechange("+")
            end,
            {description = "increase volume", group = "system"}),
        awful.key({ Modkey }, "Down",
            function()
                volumechange("-")
            end,
            {description = "decrease volume", group = "system"}),
        awful.key({}, "XF86AudioMute",
            function()
                awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
            end,
            {description = "toggle volume mute", group = "system"}),

        -- Brightness binds
        awful.key({}, "XF86MonBrightnessUp",
            function()
                brightchange("-A")
            end,
            {description = "increase bright", group = "system"}),
        awful.key({}, "XF86MonBrightnessDown",
            function()
                brightchange("-U")
            end,
            {description = "decrease bright", group = "system"}),
        awful.key({ Modkey }, "Right",
            function()
                brightchange("-A")
            end,
            {description = "increase bright", group = "system"}),
        awful.key({ Modkey }, "Left",
            function()
                brightchange("-U")
            end,
            {description = "decrease bright", group = "system"}),

        -- Others
        awful.key({}, "Print",
            function()
                awful.spawn.with_shell(Screenshot_tool)
            end,
            {description = "Screenshot", group = "system"}),
    })
end

return systembinds

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
