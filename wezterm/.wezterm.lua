local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Colorscheme
-------------------------------------------------------------------------------

local default_colorscheme = "Catppuccin Mocha"

-- Read the name of the colorscheme to use from `~/.config/colorscheme/current`
-- and look up WezTerm's name for it in `~/.config/colorscheme/mappings.json`.
-- This allows me to keep the colorscheme in sync between WezTerm, Neovim, and
-- possibly other terminal applications in the future.

local current_colorscheme_path = wezterm.home_dir .. "/.config/colorscheme/current"
local colorscheme_mappings_path = wezterm.home_dir .. "/.config/colorscheme/mappings.json"
wezterm.add_to_config_reload_watch_list(current_colorscheme_path)
wezterm.add_to_config_reload_watch_list(colorscheme_mappings_path)

local function read_current_colorscheme_from_file()
	local file = io.open(current_colorscheme_path, "r")
	if file then
		local colorscheme = file:read("*l")
		file:close()
		return colorscheme
	end
end

local function read_colorscheme_mappings_from_file()
	local file = io.open(colorscheme_mappings_path, "r")
	if file then
		local mappings_json = file:read("*a")
		file:close()
		return wezterm.json_parse(mappings_json)
	end
end

local function determine_colorscheme()
	local colorscheme = read_current_colorscheme_from_file()
	if not colorscheme then
		return default_colorscheme
	end

	local mappings = read_colorscheme_mappings_from_file()
	if mappings then
		local mapping = mappings[current_colorscheme]
		if mapping then
			colorscheme = mapping["wezterm"] or colorscheme
		end
	end

	return colorscheme
end

config.color_scheme = determine_colorscheme()

-------------------------------------------------------------------------------
-- Font
-------------------------------------------------------------------------------
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-------------------------------------------------------------------------------
-- Window Appearance
-------------------------------------------------------------------------------

config.window_decorations = "RESIZE"
config.window_padding = {
	left = "0.25cell",
	right = "0.25cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

-------------------------------------------------------------------------------
-- Misc.
-------------------------------------------------------------------------------

config.front_end = "WebGpu"
config.enable_kitty_keyboard = true
config.scrollback_lines = 10000

return config
