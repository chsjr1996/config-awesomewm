local awful       = require("awful")
local verticalbar = require("modules.verticalbar")

-- if multi_screen the index '1' will be the HDMI
local first_screen_index  = 1
local second_screen_index = 2

local multi_screen        = screen.count() > 1
local tile_layout         = awful.layout.layouts[1]
local max_layout          = awful.layout.layouts[2]
local default_layout      = multi_screen and tile_layout or max_layout

local function check_default_layout(s)
    if multi_screen then
      if s.index == second_screen_index then
        default_layout = max_layout
      end
    end
end

screen.connect_signal("request::desktop_decoration", function(s)
    check_default_layout(s)

    awful.tag({ "1", "2", "3", "4"}, s, default_layout)

    verticalbar(s)
end)

