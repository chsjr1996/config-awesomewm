-- {{{ Core & instances
pcall(require, "luarocks.loader")
require("awful.autofocus")

-- awesome internals
Awful   = require("awful")
Gears   = require("gears")

-- custom
Naughty = require("modules.naughty")
-- }}}

-- {{{ Main keys
Modkey     = "Mod4"
Altkey     = "Mod1"
-- }}}

-- {{{ System defauls
Terminal        = os.getenv("TERMINAL") or "kitty"
Editor          = os.getenv("EDITOR") or "nano"
Editor_cmd      = Terminal .. " -e " .. Editor
Screenshot_tool = "flameshot gui"
-- }}}

-- {{{ Theme config
Basic_theme_layout = true
Theme_color        = "dracula"
-- }}}

-- {{{ Custom signals
OSD_change = 'osd_change'
-- }}}

-- {{{ Dirs
Home_dir    = os.getenv("HOME")
Config_Dir  = Gears.filesystem.get_configuration_dir()

Scripts_dir = Config_Dir.."shellscripts/"

-- rofi
Rofi_launchers_dir = Home_dir.."/.config/rofi/launchers"
Rofi_apps          = Rofi_launchers_dir.."/apps.sh"
Rofi_clipboard     = Rofi_launchers_dir.."/clipboard.sh"
Rofi_calc          = Rofi_launchers_dir.."/calc.sh"
Rofi_emoji         = Rofi_launchers_dir.."/emoji.sh"
Rofi_locate        = Rofi_launchers_dir.."/locate.sh"
Rofi_browser       = Rofi_launchers_dir.."/browser.sh"
Rofi_window        = Rofi_launchers_dir.."/windows.sh"
-- }}}

-- {{{ Widgets
Calendar_popup_app = Home_dir.."/.scripts/kitty-float.sh --interactive Calendar calcurse"
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
