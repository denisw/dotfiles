local wezterm_colorschemes = {
    ["catppuccin"] = "Catppuccin Mocha",
    ["catppuccin-frappe"] = "Catppuccin Frappe",
    ["catppuccin-latte"] = "Catppuccin Latte",
    ["catppuccin-macchiato"] = "Catppuccin Macchiato",
    ["catppuccin-mocha"] = "Catppuccin Mocha",
    ["dracula"] = "Dracula (Official)",
    ["github_light"] = "Github (base16)",
    ["github_dark"] = "GitHub Dark",
    ["onedark"] = "One Dark (Gogh)",
    ["onelight"] = "One Light (Gogh)",
    ["tokyonight-storm"] = "Tokyo Night Storm",
    ["rose-pine"] = "Rosé Pine (Gogh)",
    ["rose-pine-dawn"] = "Rosé Pine Dawn (Gogh)",
    ["rose-pine-moon"] = "Rosé Pine Moon (Gogh)",
}

local function update_wezterm_colorscheme(colorscheme)
    local dirname = vim.fn.expand("$HOME/.config/wezterm")
    os.execute("mkdir '" .. dirname .. "'")

    local filename = vim.fn.expand(dirname .. "/colorscheme.lua")
    local file = io.open(filename, "w")

    file:write('return "')
    file:write(colorscheme)
    file:write('"')
    file:close()
end

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("wezterm_colorscheme", { clear = true }),
    callback = function(args)
        local colorscheme = wezterm_colorschemes[args.match]
        if colorscheme then
            update_wezterm_colorscheme(colorscheme)
        end
    end
})

return {}
