local old_cursor, old_wibox

local function change_wibox_cursor(cursor)
  if cursor ~= nil then
      local w = mouse.current_wibox
      old_cursor, old_wibox = w.cursor, w
      w.cursor = cursor
  else
      if old_wibox then
        old_wibox.cursor = old_cursor
        old_wibox = nil
      end
  end

  return {
    old_wibox,
    old_cursor
  }
end

return change_wibox_cursor

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
