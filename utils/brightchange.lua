local theme = require("theme")

local brightcontrol = Scripts_dir..'/bright_control.sh'
local step          = 5

local function brightchange(action)
    Awful.spawn.with_shell(brightcontrol..' --set '..action..' '..step)
    Awful.spawn.easy_async(brightcontrol..' --get',
        function(currentbright)
            awesome.emit_signal(OSD_change,
                currentbright,
                '\u{f0eb}',
                theme.accent
            )
        end
    )
end

return brightchange

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
