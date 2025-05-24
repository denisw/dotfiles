if vim.env.TERM_PROGRAM == "WezTerm" then
  local wezterm_colorschemes = {
    ["catppuccin"] = "Catppuccin Mocha",
    ["catppuccin-frappe"] = "Catppuccin Frappe",
    ["catppuccin-latte"] = "Catppuccin Latte",
    ["catppuccin-macchiato"] = "Catppuccin Macchiato",
    ["catppuccin-mocha"] = "Catppuccin Mocha",
    ["dawnfox"] = "dawnfox",
    ["dayfox"] = "dayfox",
    ["dracula"] = "Dracula (Official)",
    ["github_light"] = "Github (base16)",
    ["github_light_default"] = "Github (base16)",
    ["github_dark"] = "GitHub Dark",
    ["github_dark_default"] = "GitHub Dark",
    ["gruvbox"] = {
      light = "Gruvbox light, hard (base16)",
      dark = "Gruvbox dark, hard (base16)",
    },
    ["nightfox"] = "nightfox",
    ["onedark"] = "One Dark (Gogh)",
    ["onelight"] = "One Light (Gogh)",
    ["tokyonight"] = "Tokyo Night",
    ["tokyonight-day"] = "Tokyo Night Day",
    ["tokyonight-moon"] = "Tokyo Night Moon",
    ["tokyonight-storm"] = "Tokyo Night Storm",
    ["rose-pine"] = "Rosé Pine (Gogh)",
    ["rose-pine-main"] = "Rosé Pine (Gogh)",
    ["rose-pine-dawn"] = "Rosé Pine Dawn (Gogh)",
    ["rose-pine-moon"] = "Rosé Pine Moon (Gogh)",
  }

  local function update_wezterm_colorscheme(colorscheme)
    local config_path = vim.fn.expand("$HOME/.wezterm.lua")
    local config_file = io.open(config_path, "r")

    if config_file then
      local content = config_file:read("*all")
      config_file:close()

      local search_pattern = "color_scheme = ['\"][^\n]+['\"]"
      local replacement = "color_scheme = '" .. colorscheme .. "'"
      local new_content = string.gsub(content, search_pattern, replacement)

      config_file = io.open(config_path, "w")
      config_file:write(new_content)
      config_file:close()
    end
  end

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("my.wezterm_colorscheme", { clear = true }),
    callback = function(args)
      local colorscheme = wezterm_colorschemes[args.match]

      if type(colorscheme) == "table" then
        colorscheme = colorscheme[vim.o.background]
      end

      if colorscheme then
        update_wezterm_colorscheme(colorscheme)
      end
    end,
  })
end

return {}
