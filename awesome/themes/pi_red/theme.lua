---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local home = os.getenv("HOME")
local theme_path = home .. "/.config/awesome/themes/pi_red/"


local theme = {}

--dofile(themes_path .. "colors.lua")
theme.font          = "Iosevka 8"

 local defaultcolor = {
    ["white"] = "#ffffff",
    ["black"] = "#000000",
    ["greyblack"] = "#222222",
    ["darkgrey"] = "#444444",
    ["grey"] = "#aaaaaa",
    ["lightgrey"] = "#535d6c",
    ["red"] = "#ff0000",
    ["darkred"] = "#91231c"
}
local color = {
    ["redgray"] = "#9b1037",
    ["hollygreen"] = "#244228",
    ["edgegray"] = "#1c2024"
} 

theme.bg_normal     = color["edgegray"]-- default: greyblack, using darkgrey
theme.bg_focus      = color["redgray"] --default: lightgrey
theme.bg_urgent     = defaultcolor["red"]
theme.bg_minimize   = color["edgegray"] --
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = defaultcolor["gray"] -- default grey
theme.fg_focus      = defaultcolor["gray"]
theme.fg_urgent     = defaultcolor["gray"]
theme.fg_minimize   = defaultcolor["gray"]

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = color["edgegray"]
theme.border_focus  = color["redgray"]
theme.border_marked = defaultcolor["darkred"]

theme.titlebar_bg_focus = color["redgray"] 
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_path.."assets/tag_sel.png"
theme.taglist_squares_unsel = theme_path.."assets/tag_unsel.png"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme_path.."assets/titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = theme_path.."assets/titlebar/close_focus.svg"

theme.titlebar_minimize_button_normal = theme_path.."assets/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = theme_path.."assets/titlebar/minimize_focus.svg"

--theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
--theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
--theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
--theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

--theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
--theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
--theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
--theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme_path.."assets/titlebar/floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = theme_path.."assets/titlebar/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = theme_path.."assets/titlebar/floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = theme_path.."assets/titlebar/floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = theme_path.."assets/titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."assets/titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = theme_path.."assets/titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = theme_path.."assets/titlebar/maximized_focus_active.svg"

theme.wallpaper = theme_path.."assets/background.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"


-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.awesome_icon       = theme_path .. "assets/pi_logo.png"
theme.awesome_subicon    = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
