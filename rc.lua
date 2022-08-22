-- {{{ Core/Globals
require("globals")
-- }}}

-- {{{ Modules
require("modules.autostart")
require("modules.tweaks")
-- }}}

-- {{{ Signals
require("signals.defaultlayouts")
require("signals.rules")
require("signals.desktopdecoration")
require("signals.manage")
require("signals.rnotification")
-- }}}

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

-- {{{ Floating widgets
require("widgets/floating/osdbar")
-- }}}
