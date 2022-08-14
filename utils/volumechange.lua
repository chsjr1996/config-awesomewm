local spawn  = require("awful.spawn")
local notify = require("utils.notify")

local notification     = nil
local max_volume       = 150
local step             = '5'
local getCurrentVolume = os.getenv("HOME") .. '/.scripts/get_current_volume.sh'
local setCurrentVolume = 'pactl set-sink-volume @DEFAULT_SINK@ '
local current_volume   = tonumber(spawn.with_shell(getCurrentVolume))

local function volumechange(action)
  if current_volume <= max_volume or action == '-' then
    spawn.with_shell(setCurrentVolume .. action .. step .. '%')
  end

  spawn.easy_async(getCurrentVolume,
    function(stdout)
      current_volume = tonumber(stdout)
      notification = notify(notification, "Volume", stdout)
      notification:connect_signal('destroyed', function(reason, keep_alive)
        notification = nil
      end)
    end
  )
end

return volumechange

