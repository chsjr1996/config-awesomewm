local beautiful = require("beautiful")

-- Theme
local theme_path = string.format("%s/.config/awesome/theme/init.lua", os.getenv("HOME"))
beautiful.init(theme_path)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

