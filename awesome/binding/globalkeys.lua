-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")
require("awful.autofocus")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "b", function () awful.spawn("firefox") end,
              {description = "open a browser", group = "apps"}),
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "h",
        function ()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}
    ),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}
    ),
    awful.key({ modkey,           }, "l",
        function ()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "w", function () RC.mainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Layout Manipulation
    awful.key({ modkey, "Shift"   }, "h",
        function ()
            awful.client.swap.global_bydirection("left")
            if client.swap then client.swap:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "j",
        function ()
            awful.client.swap.global_bydirection("down")
            if client.swap then client.swap:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "k",
        function ()
            awful.client.swap.global_bydirection("up")
            if client.swap then client.swap:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "l",
        function ()
            awful.client.swap.global_bydirection("right")
            if client.swap then client.swap:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey, "Control" }, "l", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "h", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ modkey,           }, "d",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "a",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "d",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "a",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "d",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "a",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Prompt
    awful.key({ modkey },            "r",     function () awful.spawn.with_shell("rofi -show run") end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Resize
    awful.key({ modkey, "Control" }, "Down",  
              function () awful.client.moveresize( 0, 0, 0, -20) end),
    awful.key({ modkey, "Control" }, "Up",    
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Control" }, "Left",  
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Control" }, "Right", 
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Move
    awful.key({ modkey, "Shift"   }, "Down",  
              function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Up",    
              function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Left",  
              function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Right", 
              function () awful.client.moveresize( 20,   0,   0,   0) end),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})
