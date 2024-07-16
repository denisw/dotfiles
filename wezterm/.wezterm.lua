 local wezterm = require('wezterm')

return {
  front_end = 'WebGpu',
  color_scheme = 'dayfox',
  font = wezterm.font('Fira Code'),
  font_size = 13,
  use_fancy_tab_bar = false,
  window_decorations = 'RESIZE',
  window_padding = {
    left = '0.25cell',
    right = '0.25cell',
    top = '0.25cell',
    bottom = '0.25cell',
  },
  enable_kitty_keyboard = true,
}
