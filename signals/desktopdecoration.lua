local awful         = require("awful")

-- if multi_screen the index '2' will be the eDP-1 (notebook)
local second_screen_index = 2
local multi_screen        = screen.count() > 1
local tile_layout         = awful.layout.layouts[1]
local max_layout          = awful.layout.layouts[2]
local default_layout      = multi_screen and tile_layout or max_layout

local icons_path          = os.getenv("HOME") .. '/.config/awesome/theme/icons/'

-- on multi_screen the eDP-1 need to use max_layout by default
local function check_default_layout(s)
    if multi_screen and s.index == second_screen_index then
        default_layout = max_layout
    end
end

local function load_bars(s)
    if Basic_theme_layout then
        if s.index ~= second_screen_index then
            require("modules.basicbar")(s)
        end
    else
        require("modules.horizontalbar")(s)
        if s.index ~= second_screen_index then
            require("modules.verticalbar")(s)
        end
    end
end

screen.connect_signal("request::desktop_decoration", function(s)
    check_default_layout(s)
    awful.tag({ "", "", "", ""}, s, default_layout)
    load_bars(s)
end)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
