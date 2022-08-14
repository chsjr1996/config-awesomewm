local wibox = require("wibox")

local function widget_tray()
  return {
      wibox.widget.systray(),
      margins = 5,
      widget = wibox.container.margin,
  }
end

return widget_tray

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
