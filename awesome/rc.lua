-- If Lua\;:Rocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
--Misc libraries
local menubar = require("menubar")

-- Error handling
require("main.error-handling")
RC = {}
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Theme
require("main.theme")

local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
}

local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    clientkeys = require("binding.clientkeys"),
    bindtotags    = require("binding.bindtotags")   
}

-- Layouts
RC.layouts = main.layouts()
awful.layout.layouts = RC.layouts

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({ items = main.menu() })
RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Statusbar: Wibar
require("deco.statusbar")

--Rules
awful.rules.rules = main.rules(
    binding.clientkeys(), 
    binding.clientbuttons()
)

-- {{{ Signals
require("main.signals")
require("deco.titlebar")
