-- {{{ Core/Globals
pcall(require, "luarocks.loader")
require("awful.autofocus")

naughty    = require("modules.naughty")
terminal   = os.getenv("TERMINAL") or "kitty"
editor     = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
modkey     = "Mod4"
--- }}}

-- {{{ Modules
require("modules.layouts")
require("modules.autostart")
require("modules.tweaks")
-- }}}

--- {{{ Signals
require("signals.rules")
require("signals.desktopdecoration")
require("signals.manage")
require("signals.rnotification")
--- }}}

-- {{{ Mouse/keybinds
require("shortcuts.awesomekeybinds")()
require("shortcuts.tagkeybinds")()
require("shortcuts.launcherkeybinds")()
require("shortcuts.clientkeybinds")()
require("shortcuts.layoutkeybinds")()
require("shortcuts.rofikeybinds")()
require("shortcuts.mousebinds")()
require("shortcuts.systembinds")()
require("shortcuts.multimediabinds")()
require("shortcuts.utilskeybinds")()
-- }}}

