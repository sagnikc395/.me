local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Monaspace Krypton")
config.font_size = 16.5
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Github Dark (Gogh)"
config.audible_bell = "Disabled"
config.scrollback_lines = 10000
config.window_close_confirmation = "NeverPrompt"


return config
