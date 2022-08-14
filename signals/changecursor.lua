local changewiboxcursor = require("utils.changewiboxcursor")

local function changecursor(widget, cursor)
    widget:connect_signal("mouse::enter", function()
        changewiboxcursor(cursor or "hand2")
    end)

    widget:connect_signal("mouse::leave", function()
        changewiboxcursor(nil)
    end)
end

return changecursor

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
