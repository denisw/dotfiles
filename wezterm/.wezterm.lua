 local wezterm = require('wezterm')
 local colorscheme = require('colorscheme') or 'Catppuccin Mocha'

function get_system_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  else
    return 'Dark'
  end
end

function get_color_scheme()
   home = os.getenv("HOME")
   f = loadfile(home .. '/.config/wezterm/colorscheme.lua')
   if f then
     return f()
   else
     return 'Catppuccin Mocha'
   end
end

return {
  front_end = 'WebGpu',
  color_scheme = colorscheme,
  font_size = 13,
  use_fancy_tab_bar = false,
  window_decorations = 'RESIZE',
  window_padding = {
    left = '0.25cell',
    right = '0.25cell',
    top = '0.25cell',
    bottom = '0.25cell',
  },
}
