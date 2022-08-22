local wibox = require("wibox")
local theme = require("theme")

-- Font Awesome icon maker
local function fa_widget()
    return wibox.widget {
        font   = theme.icon_font .. theme.icon_size,
        align  = 'center',
        valign = 'center',
        widget = wibox.widget.textbox
    }
end

local function fa_markup(code, color)
    return ' <span color="'.. color ..'">' .. code .. '</span> '
end

return {
    fa_widget = fa_widget,
    fa_markup = fa_markup
}

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
