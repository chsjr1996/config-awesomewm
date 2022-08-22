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
        awful.key({ Modkey },            "space",
                  function ()
                      local promptbox = awful.screen.focused().widget_promptbox

                      if promptbox ~= nil then
                          promptbox:run()
                      else
                          awful.spawn.with_shell(Rofi_apps)
                      end
                  end,
                  {description = "run prompt", group = "launcher"}),
    })
end

return launcherkeybinds

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
