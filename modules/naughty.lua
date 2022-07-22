local naughty = require("naughty")

-- {{{ General notifications
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)
-- }}}

return {
    instance = naughty
}
