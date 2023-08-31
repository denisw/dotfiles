local wezterm = require('wezterm')

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  else
    return 'Dark'
  end
end

function scheme_for_appearance(appearance)
  if appearance:find('Dark') then
    return 'Rosé Pine (Gogh)'
  else
    return 'Rosé Pine Dawn (Gogh)'
  end
end

return {
  front_end = 'WebGpu',
  color_scheme = scheme_for_appearance(get_appearance()),
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
