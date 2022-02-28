-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {}  -- menu
local _M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
M.awesome = {
  { "hotkeys", function() 
      hotkeys_popup.show_help(nil, awful.screen.focused()) 
    end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " .config/awesome" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
  { "shutdown", "shutdown now" },
}

M.libreoffice = {
    { "launcher", "libreoffice" },
    { "docs", "libreoffice --writer" },
    { "speadsheet", "libreoffice --calc" },
    { "slideshow", "libreoffice --impress" },
    { "pdf", "libreoffice --draw" },
    { "web", "libreoffice --web" },

}

M.creative = {
    { "libreoffice", M.libreoffice },
    { "gimp", "gimp" },
    { "inkscape", "inkscape" },
    { "blender (broken)", "blender" },
    { "obs", "obs"},
    { "kdenlive", "kdenlive" },
}

M.dev = {
    { "intellij", "idea" },
    { "thunar", "thunar" },
}

M.games = {
    { "multimc", "multimc" },
    { "runelite", "runelite" },
    { "steam", "steam" },
}


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal },
    { "firefox", "firefox" },
    { "creative", M.creative },
    { "dev", M.dev },
    { "games", M.games }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)
