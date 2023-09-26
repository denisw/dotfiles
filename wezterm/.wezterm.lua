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
  colors = {
    tab_bar = {
      background = "#23293a",
      inactive_tab = {
        bg_color = "#23293a",
        fg_color = "#535e7c"
      },
      new_tab = {
        bg_color = "#23293a",
        fg_color = "#535e7c"
      },
    },
  },
  font_size = 13,
  use_fancy_tab_bar = false,
  window_decorations = 'RESIZE',
  window_padding = {
    left = '0.5cell',
    right = '0.5cell',
    top = '0.25cell',
    bottom = '0.25cell',
  },
}
