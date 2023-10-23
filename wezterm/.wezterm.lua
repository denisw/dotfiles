local wezterm = require('wezterm')

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  else
    return 'Dark'
  end
end

return {
  front_end = 'WebGpu',
  color_scheme = 'tokyonight_storm',
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
