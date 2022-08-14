local function notify(notification, title, text)
    if notification and not notification.is_expired then
        notification.message = text
    else
        notification = Naughty.instance.notification {
            title = title,
            message = text,
            timeout = 5
        }
    end

    return notification
end

return notify

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
