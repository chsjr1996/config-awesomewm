local theme_assets = require("beautiful.theme_assets")
local xresources   = require("beautiful.xresources")
local dpi          = xresources.apply_dpi

local gfs         = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir().."theme/"

local colors = require("theme.colors")

local theme = {}

theme.font          = "roboto bold 11"

theme.accent        = colors.accent

theme.bg_normal     = "#000000"
theme.bg_focus      = "#464646"
theme.bg_urgent     = "#900000"
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = Basic_theme_layout and dpi(5) or dpi(0)
theme.gap_single_client   = Basic_theme_layout and true or false
theme.border_width        = Basic_theme_layout and dpi(0) or dpi(2)
theme.border_color_normal = "#5f0000"
theme.border_color_active = theme.accent
theme.border_color_marked = "#91231c"

-- Variables set for theming notifications:
theme.notification_spacing      = 10
theme.notification_margin       = 10
theme.notification_width        = 250
theme.notification_border_width = Basic_theme_layout and dpi(0) or dpi(2)
theme.notification_border_color = theme.accent

-- Variables set for theming the menu:
theme.menu_submenu_icon = themes_path.."submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can use your own layout icons like this:
theme.layout_max  = themes_path.."layouts/max.png"
theme.layout_tile = themes_path.."layouts/tile.png"

-- Bars adjusts
theme.bars_size       = dpi(35)
theme.bars_bg         = "#000000"

-- Tag list adjusts
theme.taglist_font     = "Font Awesome 6 Free Solid "
theme.taglist_fg_focus = "#a60909"
theme.taglist_spacing  = dpi(10)

-- Task list adjusts
theme.tasklist_bg_focus    = "#000000"
theme.tasklsit_fg_focus    = "#ffffff"
theme.tasklist_fg_normal   = "#808080"
theme.tasklist_fg_minimize = "#3b3b3b"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.icon_size  = 12
theme.icon_font  = "Font Awesome 6 Free Solid "

theme.hotkeys_fg           = "#AAAAAA"
theme.hotkeys_label_fg     = "#000000"
theme.hotkeys_modifiers_fg = "#3270FF"

theme.systray_icon_spacing = dpi(10)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
