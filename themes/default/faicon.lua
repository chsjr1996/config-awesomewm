local wibox = require("wibox")
local theme = require("themes.default.theme")

-- Font Awesome icon maker
--- @see https://www.reddit.com/r/awesomewm/comments/kq79jn/awesomewm_icons_made_easy/
local function fa_widget()
  return wibox.widget{
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

