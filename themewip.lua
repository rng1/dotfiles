--[[

     ___/\/\__________________/\/\_______________________________
    _/\/\/\/\/\____/\/\/\____/\/\__/\/\__/\/\__/\/\____/\/\/\___ 
   ___/\/\______/\/\__/\/\__/\/\/\/\____/\/\__/\/\__/\/\__/\/\_  
  ___/\/\______/\/\__/\/\__/\/\/\/\______/\/\/\/\__/\/\__/\/\_   
 ___/\/\/\______/\/\/\____/\/\__/\/\________/\/\____/\/\/\___    
_____________________________________/\/\/\/\_______________     

--]]

local theme_name 	= "tokyo"

local theme_assets 	= require("beautiful.theme_assets")
local xresources 	= require("beautiful.xresources")
local dpi		= xresources.apply_dpi
local gfs		= require("gears.filesystem")
local themes_path	= gfs.get_themes_dir()

local xrdb		= xresources.get_current_theme()
--[[

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local layout_icon_path
local titlebar_icon_path
local taglist_icon_path

--]]

local theme = {}

-- >> Wallpaper <<
-- If using feh, it won't change anything.

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wallpaper.jpg"

-- >> Font <<
-- This font will be used by default in menus, bars, titlebars, etc.

theme.font = "monospace 11"

-- >> Colors <<
-- Set with .Xresources values.

theme.bg_dark       = x.background
theme.bg_normal     = x.color0
theme.bg_focus      = x.color8
theme.bg_urgent     = x.color8
theme.bg_minimize   = x.color8
theme.bg_systray    = x.background

theme.fg_normal     = x.color8
theme.fg_focus      = x.color4
theme.fg_urgent     = x.color9
theme.fg_minimize   = x.color8

-- >> Gap <<

theme.useless_gap = dpi(2)
--theme.screen_margin = dpi(5)

-- >> Borders <<

theme.border_width = dpi(0)
-- theme.border_color = x.color0
theme.border_normal = x.background
theme.border_focus  = x.background
-- Rounded corners
--theme.border_radius = dpi(6)

-- >> Titlebars <<
-- (Titlebar items can be customized in titlebars.lua)
theme.titlebars_enabled = true
theme.titlebar_size = dpi(35)
theme.titlebar_title_enabled = false
theme.titlebar_font = "sans bold 9"
-- Window title alignment: left, right, center
theme.titlebar_title_align = "center"
-- Titlebar position: top, bottom, left, right
theme.titlebar_position = "top"
theme.titlebar_bg = x.background
-- theme.titlebar_bg_focus = x.color12
-- theme.titlebar_bg_normal = x.color8
theme.titlebar_fg_focus = x.background
theme.titlebar_fg_normal = x.color8
--theme.titlebar_fg = x.color7

-- >> Edge snap <<
theme.snap_shape = gears.shape.rectangle
theme.snap_bg = x.foreground
theme.snap_border_width = dpi(3)

-- >> Tags <<

theme.taglist_font = "Noto Serif CJK JP bold"
theme.tagnames = {
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "七",
    "八",
    "九",
    "零",
}

-- /********* TO-DO *********/

-- >> Tasklist <<
theme.tasklist_font = "sans medium 8"
theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = x.color0
theme.tasklist_fg_focus = x.foreground
theme.tasklist_bg_normal = "#00000000"
theme.tasklist_fg_normal = x.foreground.."77"
theme.tasklist_bg_minimize = "#00000000"
theme.tasklist_fg_minimize = x.color8
-- theme.tasklist_font_minimized = "sans italic 8"
theme.tasklist_bg_urgent = x.background
theme.tasklist_fg_urgent = x.color3
theme.tasklist_spacing = dpi(0)
theme.tasklist_align = "center"
