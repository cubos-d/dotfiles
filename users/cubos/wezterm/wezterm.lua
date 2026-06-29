local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 1. Set the ComicShannsMono Nerd Font
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 11.0 -- Adjust your preferred scale here

-- 2. Establish the I-Beam cursor
config.default_cursor_style = 'BlinkingBar' -- Options: SteadyBar, BlinkingBar

-- 3. Set Window Opacity and Blur
config.window_background_opacity = 0.75 -- 0.0 (transparent) to 1.0 (opaque)
config.macos_window_background_blur = 20 -- Optional: Applies blur on systems that support it

return config
