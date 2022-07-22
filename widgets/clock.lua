local spawn          = require("awful.spawn")
local wibox          = require("wibox")
local commonsettings = require("utils.commonsettings")

local popupApp = os.getenv("HOME") .. '/.scripts/kitty-float.sh --interactive Calendar calcurse'

local function clock()
    local textclock = wibox.widget.textclock('<b>%H:%M</b>')

    textclock:connect_signal("button::press", function()
      spawn(popupApp, commonsettings.centered_medium_client)
    end)

    return {
      layout = wibox.container.margin,
      left = 5,
      textclock
    }
end

return clock

