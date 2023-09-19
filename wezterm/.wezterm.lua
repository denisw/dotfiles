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
  color_scheme = 'Tokyo Night Storm (Gogh)',
  colors = {
    tab_bar = {
      background = "#1f2335",
      active_tab = {
        bg_color = "#24283b",
        fg_color = "#c0caf5"
      },
      inactive_tab = {
        bg_color = "#1f2335",
        fg_color = "#c0caf5"
      },
      inactive_tab_hover = {
        bg_color = "#292e42",
        fg_color = "#c0caf5",
      },
      new_tab = {
        bg_color = "#1f2335",
        fg_color = "#c0caf5"
      },
      new_tab_hover = {
        bg_color = "#292e42",
        fg_color = "#c0caf5",
      },
    },
  },
  font_size = 13,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
}
