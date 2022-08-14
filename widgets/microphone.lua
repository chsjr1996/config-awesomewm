local awful  = require("awful")
local spawn  = require("awful.spawn")

local faicon       = require("widgets.common.faicon")
local changecursor = require("signals.changecursor")

local getIsMuted       = "pactl get-source-mute @DEFAULT_SOURCE@"
local toggleMute       = 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'
local mixerApp         = 'pavucontrol'

local function toggle_mute()
  spawn.with_shell(toggleMute)
end

local function open_mixer()
  spawn.with_shell(mixerApp)
end

local function microphone()
    local microphonewidget = awful.widget.watch(getIsMuted, 3, function (widget, stdout)
        if string.find(stdout, 'yes') then
          widget:set_markup_silently(faicon.fa_markup('\u{f131}', '#FFFFFF'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f130}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () toggle_mute() end),
            awful.button({}, 3, function () open_mixer() end)
          )
        )
    end, faicon.fa_widget())

    changecursor(microphonewidget)

    return microphonewidget
end

return microphone

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
