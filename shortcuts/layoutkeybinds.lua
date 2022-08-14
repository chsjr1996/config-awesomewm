local awful = require("awful")

local function layoutkeybinds()
  awful.keyboard.append_global_keybindings({
      awful.key({ Modkey, "Shift"   }, "l", function () awful.client.swap.byidx(  1)    end,
                {description = "swap with next client by index", group = "client"}),
      awful.key({ Modkey, "Shift"   }, "h", function () awful.client.swap.byidx( -1)    end,
                {description = "swap with previous client by index", group = "client"}),

      awful.key({ Modkey,           }, "u", awful.client.urgent.jumpto,
                {description = "jump to urgent client", group = "client"}),

      awful.key({ Modkey, Altkey          }, "p", function () awful.layout.inc( 1)                end,
                {description = "select next", group = "layout"}),

      -- awful.key({ Modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
      --           {description = "increase master width factor", group = "layout"}),
      -- awful.key({ Modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
      --           {description = "decrease master width factor", group = "layout"}),

      -- awful.key({ Modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
      --           {description = "increase the number of master clients", group = "layout"}),
      -- awful.key({ Modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
      --           {description = "decrease the number of master clients", group = "layout"}),

      -- awful.key({ Modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
      --           {description = "increase the number of columns", group = "layout"}),
      -- awful.key({ Modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
      --           {description = "decrease the number of columns", group = "layout"}),
  })
end

return layoutkeybinds

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
