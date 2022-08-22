local spawn = require("awful.spawn")
local theme = require("theme")

local notification        = nil
local maxvolume           = 150
local step                = '5'
local volumecontrolscript = Scripts_dir..'/volume_control.sh'

local function volumechange(action)
    spawn.easy_async_with_shell(volumecontrolscript..' --get', function(currentvolume)
        if tonumber(currentvolume) <= maxvolume or action == '-' then
            spawn.with_shell(volumecontrolscript..' --set '..action..step..'%')
            awesome.emit_signal(OSD_change,
                currentvolume,
                '\u{f028}',
                theme.accent
            )
        end
    end)
end

return volumechange

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
