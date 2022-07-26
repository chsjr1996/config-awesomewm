local awful = require("awful")
local spawn = require("awful.spawn")

local faicon         = require("widgets.common.faicon")
local commonsettings = require("utils.commonsettings")
local changecursor   = require("signals.changecursor")

local currentUsedCpu = os.getenv("HOME") .. '/.scripts/system-load.sh cpu'
local topCmd         = os.getenv("HOME") .. '/.scripts/kitty-float.sh --interactive System\\ monitor btop'
local high_usage     = 60
local medium_usage   = 30

local function open_top_term()
  spawn(topCmd, commonsettings.centered_medium_client)
end

local function cpu()
    local cpuwidget = awful.widget.watch(currentUsedCpu, 3, function (widget, stdout)
        if tonumber(stdout) >= high_usage then
          widget:set_markup_silently(faicon.fa_markup('\u{f2db}', '#E91300'))
        elseif tonumber(stdout) >= medium_usage then
          widget:set_markup_silently(faicon.fa_markup('\u{f2db}', '#FFD100'))
        else
          widget:set_markup_silently(faicon.fa_markup('\u{f2db}', '#FFFFFF'))
        end

        widget:buttons(
          awful.util.table.join(
            awful.button({}, 1, function () open_top_term() end)
          )
        )
    end, faicon.fa_widget())

    changecursor(cpuwidget)

    return cpuwidget
end

return cpu

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
