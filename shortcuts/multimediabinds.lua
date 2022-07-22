local awful = require("awful")

local function multimediabinds()
    awful.keyboard.append_global_keybindings({
        awful.key({ modkey }, ";",
                  function()
                    awful.spawn.with_shell("playerctl play-pause")
                  end,
                  {description = "toggle play pause media", group = "multimedia"}),
        awful.key({ modkey }, ".",
                  function()
                    awful.spawn.with_shell("playerctl next")
                  end,
                  {description = "next media", group = "multimedia"}),
        awful.key({ modkey }, ",",
                  function()
                    awful.spawn.with_shell("playerctl previous")
                  end,
                  {description = "previous media", group = "multimedia"}),
    })
end

return multimediabinds

