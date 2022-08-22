local awful = require("awful")
local spawn = require("awful.spawn")

local theme        = require("theme")
local faicon       = require("widgets.common.faicon")
local notify       = require("utils.notify")
local brightchange = require("utils.brightchange")
local changecursor = require("signals.changecursor")

local notification       = nil
local getCurrentBatLevel = 'cat /sys/class/power_supply/BAT0/capacity'
local chargingStatus     = 'acpi -a'
local isCharging         = true

local function get_current_bat_level()
  spawn.easy_async(getCurrentBatLevel,
    function(currentlevel)
        awesome.emit_signal(OSD_change,
            "100",
            '\u{f240}',
            theme.accent
        )
    end
  )
end

local function checkIsCharging()
  spawn.easy_async(chargingStatus,
    function(stdout)
      if string.find(stdout, 'on') then
        isCharging = true
      else
        isCharging = false
      end
    end
  )
end

local function batteryicon()
    local brightnesswidget = awful.widget.watch(getCurrentBatLevel, 3, function (widget, stdout)
        checkIsCharging()

        if tonumber(stdout) <= 60 and isCharging == false then
          notify("Battery", "Less than 60%")
        end

        if isCharging then
          widget:set_markup_silently(faicon.fa_markup('\u{f240}', '#FFFFFF'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f240}', '#ED0000'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () get_current_bat_level() end),
            awful.button({}, 4, function() brightchange("-A") end),
            awful.button({}, 5, function() brightchange("-U") end)
          )
        )
    end, faicon.fa_widget())

    changecursor(brightnesswidget)

    return brightnesswidget
end

return batteryicon

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
