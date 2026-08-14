local wezterm = require "wezterm"
local config = wezterm.config_builder()

local bg_color_tabs = "rgba(7, 0, 18, 0.4)"
local bg_color = "rgb(7, 0, 18)"
-- 1. Set the ComicShannsMono Nerd Font
config.font = wezterm.font "ComicShannsMono Nerd Font"
config.font_size = 11.0 -- Adjust your preferred scale here

-- 2. Establish the I-Beam cursor
config.default_cursor_style = "BlinkingBar" -- Options: SteadyBar, BlinkingBar

-- 3. Set Window Opacity and Blur
config.window_background_opacity = 0.75 -- 0.0 (transparent) to 1.0 (opaque)
config.macos_window_background_blur = 20 -- Optional: Applies blur on systems that support it

-- Tab bar configs
config.window_frame = {
    active_titlebar_bg = bg_color_tabs,
    inactive_titlebar_bg = bg_color_tabs,
    active_titlebar_fg = '#ffffff',
    inactive_titlebar_fg = '#cccccc',
    button_bg = "rgba(110, 7, 7, 0.61)"
}

config.colors = {
  background = bg_color,
  tab_bar = {
    active_tab = {
      bg_color = "rgba(43, 32, 66, 0.5)", -- Active tab background
      fg_color = "rgba(180, 157, 11, 0.97)", -- Active tab text color
    },
    inactive_tab = {
      bg_color = "rgba(0, 0, 0, 0.1)", -- Active tab background
      fg_color = "rgba(111, 98, 12, 0.52)", -- Active tab text color
    },
  },
}

return config
