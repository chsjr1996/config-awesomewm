local awful = require("awful")

local hotkeys_popup    = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
-- package.loaded["awful.hotkeys_popup.keys.tmux"] = {}

function awesomekeybinds()
    awful.keyboard.append_global_keybindings({
      awful.key({ Modkey,           }, "/",      hotkeys_popup.show_help,
                {description="show help", group="awesome"}),
      awful.key({ Modkey, "Control" }, "r", awesome.restart,
                {description = "reload awesome", group = "awesome"}),
      awful.key({ Modkey, "Shift"   }, "q", awesome.quit,
                {description = "quit awesome", group = "awesome"}),
      awful.key({ Modkey }, "b",
        function()
          local myscreen = awful.screen.focused()
          myscreen.mainbar.visible = not myscreen.mainbar.visible
        end,
        {description = "toggle wibar visibility", group = "awesome"}
      )
    })
end

return awesomekeybinds

