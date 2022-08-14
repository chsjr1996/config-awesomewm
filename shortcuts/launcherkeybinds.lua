local awful   = require("awful")
local menubar = require("menubar")

local function launcherkeybinds()
    menubar.utils.terminal = Terminal

    awful.keyboard.append_global_keybindings({
        awful.key({ Modkey, "Shift" }, "r",
                  function ()
                      menubar.refresh()
                  end,
                  {description = "refresh menubar", group = "launcher"}),
        awful.key({ Modkey,           }, "Return",
                  function ()
                      awful.spawn(Terminal)
                  end,
                  {description = "open a terminal", group = "launcher"}),
        awful.key({ Modkey },            "r",
                  function ()
                      awful.screen.focused().widget_promptbox:run()
                  end,
                  {description = "run prompt", group = "launcher"}),
    })
end

return launcherkeybinds

