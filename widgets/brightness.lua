local awful  = require("awful")
local spawn  = require("awful.spawn")
local faicon = require("themes.default.faicon")
local notify = require("utils.notify")

local getCurrentBatLevel = 'cat /sys/class/power_supply/BAT0/capacity'
local chargingStatus     = 'acpi -a'
local isCharging         = true
local step               = 5

local function brightness_change(action)
  spawn.with_shell('light ' .. action .. ' ' .. step)
  spawn.easy_async('light -G',
    function(stdout)
      notify("Brightness", stdout)
    end
  )
end

local function get_current_bat_level()
  spawn.easy_async(getCurrentBatLevel,
    function(stdout)
      notify("Battery", stdout)
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

local function brightness()
    return awful.widget.watch(getCurrentBatLevel, 3, function (widget, stdout)
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
            awful.button({}, 4, function() brightness_change("-A") end),
            awful.button({}, 5, function() brightness_change("-U") end)
          )
        )
    end, faicon.fa_widget())
end

return brightness

