--[[
   __     __  __  __     __    ____    ___     ___ ___      __   
 /'__`\  /\ \/\ \/\ \  /'__`\ /',__\  / __`\ /' __` __`\  /'__`\ 
/\ \L\.\_\ \ \_/ \_/ \/\  __//\__, `\/\ \L\ \/\ \/\ \/\ \/\  __/ 
\ \__/.\_\\ \___x___/'\ \____\/\____/\ \____/\ \_\ \_\ \_\ \____\
 \/__/\/_/ \/__//__/   \/____/\/___/  \/___/  \/_/\/_/\/_/\/____/

--]]

local themes = {
    "tokyo",    -- 1 --
}

local theme = themes[1]

-- ====================================================
-- Window appearance: titlebar, buttons, ...

local decoration_themes = {
    "tokyo",    -- 1 --
}

local decoration_theme = decoration_themes[1]

-- ====================================================
-- Status bar themes

local bar_themes = {
    "tokyo",    -- 1 --
}

local bar_theme = bar_themes[1]

-- ====================================================
-- Icon theme used by widgets that display image icons

local icon_themes = {
    "tokyo",    -- 1 --
}

local icon_theme = icon_themes[1]

-- ========================================================================
-- User variables

user = {
    -- >> Default applications <<
    terminal = "kitty -1",
    floating_terminal = "kitty -1",
    browser = "firefox",
    file_manager = "kitty -1 --class files -e ranger",
    editor = "kitty -1 --class editor -e nvim",

    -- >> Web search <<
    --web_search_cmd = "xdg-open https://duckduckgo.com/?q="

    -- >> Directories <<
    dirs = {
        downloads = os.getenv("XDG_DOWNLOAD_DIR") or "~/downloads",
	documents = os.getenv("XDG_DOCUMENTS_DIR") or "~/files",
	pictures = os.getenv("XDG_PICTURES_DIR") os "~/pictures",
    },

    -- >> Battery <<
    battery_threshold_low = 20,
    battery_threshold_critical = 5,
}

-- ========================================================================
-- Init

-- Theme Handling
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()

-- Make dpi function global
-- dpi = beatiful.xresources.apply_dpi

-- Make xresources colors global
-- Make xresources colors global
x = {
    --           xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color1     = xrdb.color1,
    color2     = xrdb.color2,
    color3     = xrdb.color3,
    color4     = xrdb.color4,
    color5     = xrdb.color5,
    color6     = xrdb.color6,
    color7     = xrdb.color7,
    color8     = xrdb.color8,
    color9     = xrdb.color9,
    color10    = xrdb.color10,
    color11    = xrdb.color11,
    color12    = xrdb.color12,
    color13    = xrdb.color13,
    color14    = xrdb.color14,
    color15    = xrdb.color15,
}

-- Standard AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Default notification library
local naughty = require("naughty")

-- Load theme
local theme_dir = os.getenv("XDG_CONFIG_HOME") .. "/awesome/themes/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")

-- Error handling
-- ========================================================================
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

-- Features
-- ========================================================================
-- Initialize icons array and load icon theme
local icons = require("icons")
icons.init(icon_theme)
-- Keybinds and mousebinds
local keys = require("keys")

-- Get screen geometry
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Layouts
-- ===================================================================
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}

-- Wallpaper
-- ===================================================================
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        -- Set last wallpaper with feh
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
    end
end

-- Set wallpaper
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tags
-- ========================================================================
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Alias to save time :)
    -- Tag layouts
    local layouts = {
        l.max,
        l.max,
        l.max,
        l.max,
        l.tile,
        l.max,
        l.max,
        l.max,
        l.tile,
        l.max
    }

    -- Tag names
    local tagnames = beautiful.tagnames or { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
    -- Create all tags at once (without seperate configuration for each tag)
    awful.tag(tagnames, s, layouts)
end)

-- Determines how floating clients should be placed
local floating_client_placement = function(c)
    -- If the layout is floating or there are no other visible
    -- clients, center client
    if awful.layout.get(mouse.screen) ~= awful.layout.suit.floating or #mouse.screen.clients == 1 then
        return awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
    end

    -- Else use this placement
    local p = awful.placement.no_overlap + awful.placement.no_offscreen
    return p(c, {honor_padding = true, honor_workarea=true, margins = beautiful.useless_gap * 2})
end

local centered_client_placement = function(c)
    return gears.timer.delayed_call(function ()
        awful.placement.centered(c, {honor_padding = true, honor_workarea=true})
    end)
end

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================

-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)








