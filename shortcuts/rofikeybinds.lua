local awful = require("awful")

local groupname = "rofi"

local function rofikeybinds()
    awful.keyboard.append_global_keybindings({
        awful.key({ modkey }, "space",
                  function()
                      awful.spawn.with_shell(Rofi_apps)
                  end,
                  {description = "show the menubar", group = groupname}),
        awful.key({ modkey,           }, "F1",
                  function()
                      awful.spawn.with_shell(Rofi_clipboard)
                  end,
                  {description = "show clipboard menu", group = groupname}),
        awful.key({ modkey,           }, "F2",
                  function()
                      awful.spawn.with_shell(Rofi_calc)
                  end,
                  {description = "show calc menu", group = groupname}),
        awful.key({ modkey,           }, "F3",
                  function()
                      awful.spawn.with_shell(Rofi_emoji)
                  end,
                  {description = "show emoji menu", group = groupname}),
        awful.key({ modkey,           }, "F4",
                  function()
                      awful.spawn.with_shell(Rofi_locate)
                  end,
                  {description = "show locate menu", group = groupname}),
        awful.key({ modkey,           }, "F5",
                  function()
                      awful.spawn.with_shell(Rofi_browser)
                  end,
                  {description = "show file browser", group = groupname}),
        awful.key({ modkey,           }, "Tab",
                  function ()
                    awful.spawn.with_shell(Rofi_window)
                  end,
                  {description = "show window selector", group = groupname}),
    })
end

return rofikeybinds

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
