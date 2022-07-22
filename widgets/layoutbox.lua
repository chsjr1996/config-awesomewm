local awful = require("awful")
local wibox = require("wibox")

local function layoutbox(screen)
    return {
      layout = wibox.container.margin,
      margins = 5,
      -- left = 10,
      awful.widget.layoutbox {
        screen  = screen,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
      }
    }
end

return layoutbox

