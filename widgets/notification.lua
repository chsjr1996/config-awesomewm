local awful  = require("awful")
local faicon = require("widgets.common.faicon")
local notify = require("utils.notify")

local getIsPaused = naughty.instance.is_suspended()

local function toggle_pause()
  naughty.instance.toggle()
end

local function notification()
    return awful.widget.watch(getIsPaused, 3, function (widget, stdout)
        if stdout then
          widget:set_markup_silently(faicon.fa_markup('\u{f131}', '#FFFFFF'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f130}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () toggle_pause() end)
          )
        )
    end, faicon.fa_widget())
end

return notification

