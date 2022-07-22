local awful = require("awful")

local function utilskeybinds()
    awful.keyboard.append_global_keybindings({
        awful.key({ modkey }, "p",
                  function()
                    awful.spawn.with_shell("rofi-pass")
                  end,
                  {description = "open pass dmenu (type)", group = "utils"}),
    })
end

return utilskeybinds

