local awful = require("awful")

function tagkeybinds()
    awful.keyboard.append_global_keybindings({
        awful.key({ Altkey, }, "Escape", awful.tag.history.restore,
                  {description = "go back", group = "tag"}),
        awful.key({ Modkey, }, "j",
            function ()
                local screen = awful.screen.focused()
                awful.tag.viewnext(screen)
            end,
            {description = "focus next by index", group = "tag"}
        ),
        awful.key({ Modkey, }, "k",
            function ()
                local screen = awful.screen.focused()
                awful.tag.viewprev(screen)
            end,
            {description = "focus previous by index", group = "tag"}
        ),
        awful.key {
            modifiers   = { Modkey },
            keygroup    = "numrow",
            description = "only view tag",
            group       = "tag",
            on_press    = function (index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then
                    tag:view_only()
                end
            end,
        },
        awful.key {
            modifiers   = { Modkey, "Control" },
            keygroup    = "numrow",
            description = "toggle tag",
            group       = "tag",
            on_press    = function (index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
        },
        awful.key {
            modifiers = { Modkey, "Shift" },
            keygroup    = "numrow",
            description = "move focused client to tag",
            group       = "tag",
            on_press    = function (index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
        },
        awful.key {
            modifiers   = { Modkey, "Control", "Shift" },
            keygroup    = "numrow",
            description = "toggle focused client on tag",
            group       = "tag",
            on_press    = function (index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
        },
    })
end

return tagkeybinds

