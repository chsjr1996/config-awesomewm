-- {{{ Core & instances
pcall(require, "luarocks.loader")
require("awful.autofocus")
Naughty    = require("modules.naughty")
-- }}}

-- {{{ Main keys
modkey     = "Mod4"
Altkey     = "Mod1"
-- }}}

-- {{{ System defauls
Terminal   = os.getenv("TERMINAL") or "kitty"
Editor     = os.getenv("EDITOR") or "nano"
Editor_cmd = Terminal .. " -e " .. Editor
-- }}}

-- {{{ Theme config
Basic_theme_layout = true
Theme_color        = "material" -- material or red
-- }}}

-- {{{ Rofi launchers
local rofiLaunchersDir = os.getenv("HOME").."/.config/rofi/launchers"
Rofi_apps      = rofiLaunchersDir.."/apps.sh"
Rofi_clipboard = rofiLaunchersDir.."/clipboard.sh"
Rofi_calc      = rofiLaunchersDir.."/calc.sh"
Rofi_emoji     = rofiLaunchersDir.."/emoji.sh"
Rofi_locate    = rofiLaunchersDir.."/locate.sh"
Rofi_browser   = rofiLaunchersDir.."/browser.sh"
Rofi_window    = rofiLaunchersDir.."/windows.sh"
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
