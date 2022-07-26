local awful = require("awful")

function clientkeybinds()
    awful.keyboard.append_global_keybindings({
      awful.key({ Modkey,           }, "l",
          function ()
              awful.client.focus.byidx( 1)
          end,
          {description = "focus next by index", group = "client"}
      ),
      awful.key({ Modkey,           }, "h",
          function ()
              awful.client.focus.byidx(-1)
          end,
          {description = "focus previous by index", group = "client"}
      ),
      awful.key({ Altkey,          }, "Tab",
          function ()
              awful.client.focus.history.previous()
              if client.focus then
                  client.focus:raise()
              end
          end,
          {description = "go back", group = "client"}),
      awful.key({ Modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
                {description = "focus the next screen", group = "screen"}),
      awful.key({ Modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
                {description = "focus the previous screen", group = "screen"}),
      awful.key({ Modkey, "Control" }, "n",
                function ()
                    local c = awful.client.restore()
                    -- Focus restored client
                    if c then
                      c:activate { raise = true, context = "key.unminimize" }
                    end
                end,
                {description = "restore minimized", group = "client"}),
  })

  client.connect_signal("request::default_keybindings", function()
        awful.keyboard.append_client_keybindings({
            awful.key({ Modkey,           }, "f",
                function (c)
                    c.fullscreen = not c.fullscreen
                    c:raise()
                end,
                {description = "toggle fullscreen", group = "client"}),
            awful.key({ Modkey,           }, "c",
                function (c)
                  c.floating = true
                  c.placement = awful.placement.centered(c)
                end,
                {description = "centralize client", group = "client"}),
            awful.key({ Modkey, "Shift"   }, "c",
                function (c)
                  c.floating = true
                  c.width = 1150
                  c.height = 600
                  c.placement = awful.placement.centered(c)
                end,
                {description = "centralize and resize client", group = "client"}),
            awful.key({ Modkey,           }, "w",      function (c) c:kill()                         end,
                    {description = "close", group = "client"}),
            awful.key({ Modkey,           }, "s",  awful.client.floating.toggle                     ,
                    {description = "toggle floating", group = "client"}),
            awful.key({ Modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                    {description = "move to master", group = "client"}),
            awful.key({ Modkey,  "Shift"  }, "o",      function (c) c:move_to_screen()               end,
                    {description = "move to screen", group = "client"}),
            awful.key({ Modkey,           }, "o",      function ()  awful.screen.focus_relative(1)   end,
                    {description = "jump to screen", group = "client"}),
            awful.key({ Modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                    {description = "toggle keep on top", group = "client"}),
            awful.key({ Modkey,           }, "n",
                function (c)
                    -- The client currently has the input focus, so it cannot be
                    -- minimized, since minimized clients can't have the focus.
                    c.minimized = true
                end ,
                {description = "minimize", group = "client"}),
            awful.key({ Modkey,           }, "m",
                function (c)
                    c.maximized = not c.maximized
                    c:raise()
                end ,
                {description = "(un)maximize", group = "client"}),
            awful.key({ Modkey, "Control" }, "m",
                function (c)
                    c.maximized_vertical = not c.maximized_vertical
                    c:raise()
                end ,
                {description = "(un)maximize vertically", group = "client"}),
            awful.key({ Modkey, "Shift"   }, "m",
                function (c)
                    c.maximized_horizontal = not c.maximized_horizontal
                    c:raise()
                end ,
                {description = "(un)maximize horizontally", group = "client"}),
        })
  end)
end

return clientkeybinds

