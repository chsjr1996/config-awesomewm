local awful          = require("awful")
local spawn          = require("awful.spawn")
local faicon         = require("themes.default.faicon")
local commonsettings = require("utils.commonsettings")

local currentSpeed = os.getenv("HOME") .. '/.scripts/system-fan-speed.sh'
local sensorsCmd   = os.getenv("HOME") .. '/.scripts/kitty-float.sh --oneshot Sensors sensors'
local high_speed   = 3
local medium_speed = 2

local function open_sensors_term()
  spawn(sensorsCmd, commonsettings.centered_medium_client)
end

local function fan()
    return awful.widget.watch(currentSpeed, 3, function (widget, stdout)
        if tonumber(stdout) >= high_speed then
          widget:set_markup_silently(faicon.fa_markup('\u{f863}', '#E91300'))
        elseif tonumber(stdout) >= medium_speed then
          widget:set_markup_silently(faicon.fa_markup('\u{f863}', '#FFD100'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f863}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () open_sensors_term() end)
          )
        )
    end, faicon.fa_widget())
end

return fan

