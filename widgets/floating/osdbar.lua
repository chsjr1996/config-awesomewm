-----------------------------------------------------------
-- OSD widget (useful to show volume or bright status)
-----------------------------------------------------------

-- libs
local awful     = require("awful")
local wibox     = require("wibox")
local gears     = require("gears")
local beautiful = require("beautiful")
local dpi       = beautiful.xresources.apply_dpi

local faicon       = require("widgets.common.faicon")
local shape        = require("utils.shape")
local changecursor = require("signals.changecursor")
local theme        = require("theme")

-- settings
local offsetx    = dpi(56)
local offsety    = dpi(300)
local osdtimeout = 5

-- the OSD container
local osdbarcontainer = wibox({
   width   = dpi(48),
   height  = offsety,
   shape   = shape.rounded_shape,
   visible = false,
   ontop   = true
})

-- the progressbar widget setup
local osdbar = wibox.widget {
    widget           = wibox.widget.progressbar,
    shape            = gears.shape.rounded_bar,
    color            = theme.accent,
    background_color = beautiful.bg_focus,
    max_value        = 100,
    value            = 0
}

-- use FontAwesome widget as icon
local osdicon = faicon.fa_widget()

osdbarcontainer:setup {
    layout = wibox.layout.align.vertical,
    -- the progressbar
    {
        wibox.container.margin(
            osdbar, dpi(14), dpi(20), dpi(20), dpi(20)
        ),
        forced_height = offsety * 0.75,
        direction     = "east",
        layout        = wibox.container.rotate
    },
    -- the osd current icon
    wibox.container.margin(
        osdicon
    )
}

-- close on 'left' click
osdbarcontainer:buttons (
    awful.util.table.join(
        awful.button({}, 1, function ()
            osdbarcontainer.visible = false
        end)
    )
)
---- change cursor to 'hand2'
changecursor(osdbarcontainer)

-- create a 'X' second timer to hide the 'osdbarcontainer' widget
local hide_osdbarcontainer = gears.timer {
    timeout = osdtimeout,
    autostart = true,
    callback = function()
        osdbarcontainer.visible = false
    end
}

local function set_osdbarcontainer_geometry()
    local currentscreen = awful.screen.focused()
    local xpos = currentscreen.geometry.width - offsetx
    local ypos = (currentscreen.geometry.height / 2) - (offsety / 2)

    osdbarcontainer.screen = currentscreen
    osdbarcontainer:geometry({
        x = xpos,
        y = ypos,
    })
end

-- show OSD when "osd_change" signal is emitted
awesome.connect_signal(OSD_change,
    function(currentvalue, iconvalue, iconcolor)
        local currentvaluenumber = tonumber(currentvalue)
        osdbar.value = currentvaluenumber
        osdicon:set_markup_silently(faicon.fa_markup(iconvalue, iconcolor))

        set_osdbarcontainer_geometry()

        if osdbarcontainer.visible then
            hide_osdbarcontainer:again()
        else
            osdbarcontainer.visible = true
            hide_osdbarcontainer:start()
        end
    end
)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
