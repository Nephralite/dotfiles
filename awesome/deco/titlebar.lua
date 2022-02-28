-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")
--spacing
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
    -- create titlebar Widget
    awful.titlebar(c, {size=25, position = "left" }) : setup {
        { -- Top
                {
                awful.titlebar.widget.closebutton    (c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.minimizebutton(c),
                spacing = dpi(5),
                layout = wibox.layout.fixed.vertical()
            },
		    margins = dpi(5),
		    widget = wibox.container.margin,
        },
        { -- Middle
		    buttons = buttons,
		    layout = wibox.layout.flex.vertical
        },
        { -- Bottom
            awful.titlebar.widget.floatingbutton (c),
	    	margins = dpi(5),
   		    widget = wibox.container.margin
        },
        layout = wibox.layout.align.vertical,
    }
end)
