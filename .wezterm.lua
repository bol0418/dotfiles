local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font("Moralerspace Neon HWNF", {
    weight = "Regular",
    stretch = "Normal",
    style = "Normal"
})
config.font_size = 12
config.window_frame = {
    font = wezterm.font("Moralerspace Neon HWNF", {
        weight = "Bold",
        stretch = "Normal",
        style = "Normal"
    }),
    font_size = 10
}

config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.colors = {
    tab_bar = {
        background = "#002b36",
        active_tab = {
            bg_color = "#002b36",
            fg_color = "#839496",
            intensity = "Normal",
            underline = "None",
            italic = false,
            strikethrough = false
        }
    }
}

config.window_background_opacity = 0.8
config.window_decorations = 'RESIZE'

config.default_domain = 'WSL:Ubuntu'

return config
