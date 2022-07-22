local awful          = require("awful")
local spawn          = require("awful.spawn")
local faicon         = require("widgets.common.faicon")
local volumechange   = require("utils.volumechange")
local commonsettings = require("utils.commonsettings")

local getIsMuted   = "pactl get-sink-mute @DEFAULT_SINK@ | awk '/yes/ {print $2; exit}'"
local toggleMute   = 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
local mixerCmd     = os.getenv("HOME") .. '/.scripts/kitty-float.sh --interactive Mixer pulsemixer'

local function toggle_mute()
  spawn.with_shell(toggleMute)
end

local function open_mixer()
  spawn(mixerCmd, commonsettings.centered_medium_client)
end

local function volume()
    return awful.widget.watch(getIsMuted, 3, function (widget, stdout)
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
end

return volume

