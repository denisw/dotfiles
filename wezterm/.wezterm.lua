local wezterm = require("wezterm")

return {
	front_end = "WebGpu",
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 13,
	window_decorations = "RESIZE",
	window_padding = {
		left = "0.25cell",
		right = "0.25cell",
		top = "0.25cell",
		bottom = "0.25cell",
	},
	enable_kitty_keyboard = true,
	scrollback_lines = 10000,
}
