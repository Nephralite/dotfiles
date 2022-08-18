-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

--Dynamic titlebars and rounding

client.connect_signal("tagged",function(c) 
	if c.floating or c.first_tag.layout.name == "floating" then 
        c:emit_signal("request::titlebars")
	else 
        awful.titlebar.hide(c, "left")
        c.shape = gears.shape.rectangle
	end 
end)

client.connect_signal("manage", function(c)
    if c.floating or c.first_tag.layout.name == "floating" then
        c:emit_signal("request::titlebars")
        c.shape = function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,10)
         end
     else
         awful.titlebar.hide(c, "left")
         c.shape = gears.shape.rectangle
    end
end)

tag.connect_signal("property::layout", function(t)
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            c:emit_signal("request::titlebars")
            c.shape = function(cr,w,h)
                gears.shape.rounded_rect(cr,w,h,10)
            end 
        else
            awful.titlebar.hide(c, "left")
            c.shape = gears.shape.rectangle
        end
    end
end)

client.connect_signal("request::geometry", function(c)
         if client.focus then
                 if not client.focus.fullscreen then
                         client.focus.border_width = beautiful.border_width
                 end
         end
 end)
