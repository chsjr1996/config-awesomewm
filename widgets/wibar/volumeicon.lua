local awful = require("awful")
local spawn = require("awful.spawn")

local faicon         = require("widgets.common.faicon")
local volumechange   = require("utils.volumechange")
local commonsettings = require("utils.commonsettings")
local changecursor   = require("signals.changecursor")

local volumecontrolscript = Scripts_dir..'/volume_control.sh'
local mixerCmd     = os.getenv("HOME") .. '/.scripts/kitty-float.sh --interactive Mixer pulsemixer'

local function toggle_mute()
    spawn.with_shell(volumecontrolscript..' --togglemute')
end

local function open_mixer()
    spawn(mixerCmd, commonsettings.centered_medium_client)
end

local function volumeicon()
    local volumewidget = awful.widget.watch(volumecontrolscript..' --ismuted', 3, function (widget, stdout)
        if string.find(stdout, 'yes') then
          widget:set_markup_silently(faicon.fa_markup('\u{f6a9}', '#FFFFFF'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f028}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () toggle_mute() end),
            awful.button({}, 3, function () open_mixer() end),
            awful.button({}, 4, function () volumechange("+") end),
            awful.button({}, 5, function () volumechange("-") end)
          )
        )
    end, faicon.fa_widget())

    changecursor(volumewidget)

    return volumewidget
end

return volumeicon

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
