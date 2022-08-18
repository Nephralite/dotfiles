-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")

--spacing
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Wibar

-- Create a textclock widget
mytextclock = wibox.widget.textclock("%H:%M")

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    layout = wibox.layout.fixed.vertical,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    --style.disable_task_name = true,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout = {
              spacing = 5,
              layout  = wibox.layout.fixed.vertical
          },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
	-- not a widget instance.
	widget_template = {
	    {
		    {
				{
				    id	 = 'clienticon',
					widget = awful.widget.clienticon,
				},
				margins = 2,
				widget  = wibox.container.margin
			},
			id			= 'background_role',
			widget		= wibox.container.background,
		},
		create_callback = function(self, c, index, objects) --luacheck: no unused args
			self:get_children_by_id('clienticon')[1].client = c
		end,
		layout = wibox.layout.align.vertical,
	},
  }
    
  --make a vertical systray
  s.mysystray = wibox.widget.systray()
  s.mysystray:set_horizontal(false)

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "left", screen = s, width = 28 })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.vertical,
    { -- Top widgets
      layout = wibox.layout.fixed.vertical,
      s.mytaglist,
      --s.mypromptbox, --I don't use this
    },
    --{-- Middle widget
        s.mytasklist, -- tasklist is rewritten
    --},
    { -- Bottom widgets
      layout = wibox.layout.fixed.vertical,
      s.mysystray,
      volume_widget{
            widget_type = 'icon'
        },
      mytextclock,
      mykeyboardlayout,
      s.mylayoutbox,
      RC.launcher,
      spacing = dpi(1),
    },
  }
end)
