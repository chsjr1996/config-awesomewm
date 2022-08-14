local awful = require("awful")

local function promptbox()
    return awful.widget.prompt()
end

return promptbox

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
