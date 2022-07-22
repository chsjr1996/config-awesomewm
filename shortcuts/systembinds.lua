local awful        = require("awful")
local volumechange = require("utils.volumechange")

local function systembinds()
    awful.keyboard.append_global_keybindings({
        -- Volume binds
        awful.key({}, "XF86AudioRaiseVolume",
                  function()
                    volumechange('+')
                  end,
                  {description = "increase volume", group = "system"}),
        awful.key({}, "XF86AudioLowerVolume",
                  function()
                    volumechange('-')
                  end,
                  {description = "decrease volume", group = "system"}),
        awful.key({ modkey }, "Up",
                  function()
                    volumechange('+')
                  end,
                  {description = "increase volume", group = "system"}),
        awful.key({ modkey }, "Down",
                  function()
                    volumechange('-')
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
                    awful.spawn.with_shell("light -A 5")
                  end,
                  {description = "increase bright", group = "system"}),
        awful.key({}, "XF86MonBrightnessDown",
                  function()
                    awful.spawn.with_shell("light -U 5")
                  end,
                  {description = "decrease bright", group = "system"}),
        awful.key({ modkey }, "Right",
                  function()
                    awful.spawn.with_shell("light -A 5")
                  end,
                  {description = "increase bright", group = "system"}),
        awful.key({ modkey }, "Left",
                  function()
                    awful.spawn.with_shell("light -U 5")
                  end,
                  {description = "decrease bright", group = "system"}),

        -- Others
        awful.key({}, "Print",
                  function()
                    awful.spawn.with_shell("flameshot gui")
                  end,
                  {description = "Screenshot", group = "system"}),
    })
end

return systembinds

