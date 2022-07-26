local awful = require("awful")
local spawn = require("awful.spawn")

local faicon         = require("widgets.common.faicon")
local commonsettings = require("utils.commonsettings")
local changecursor   = require("signals.changecursor")

local currentUsedMemory = os.getenv("HOME") .. '/.scripts/system-load.sh mem'
local topCmd            = os.getenv("HOME") .. '/.scripts/kitty-float.sh --interactive System\\ monitor btop'
local high_usage        = 70
local medium_usage      = 40

local function open_top_term()
  spawn(topCmd, commonsettings.centered_medium_client)
end

local function memory()
    local memorywidget = awful.widget.watch(currentUsedMemory, 3, function (widget, stdout)
        if tonumber(stdout) >= high_usage then
          widget:set_markup_silently(faicon.fa_markup('\u{f538}', '#E91300'))
        elseif tonumber(stdout) >= medium_usage then
          widget:set_markup_silently(faicon.fa_markup('\u{f538}', '#FFD100'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f538}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () open_top_term() end)
          )
        )
    end, faicon.fa_widget())

    changecursor(memorywidget)

    return memorywidget
end

return memory

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
