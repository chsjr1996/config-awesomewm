local awful  = require("awful")
local faicon = require("widgets.common.faicon")
local notify = require("utils.notify")

local getIsPaused = Naughty.instance.suspended

local function toggle_pause()
    Naughty.instance.suspended = not Naughty.instance.suspended
end

local function notification()
    return awful.widget.watch(getIsPaused, 3, function (widget, is_suspended)
        notify('Notification is', is_suspended and 'yes' or 'no')
        if is_suspended then
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

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
