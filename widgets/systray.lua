local wibox = require("wibox")

local function systray()
    return {
        layout = wibox.container.margin,
        left = 10,
        wibox.widget.systray(),
    }
end

return systray

