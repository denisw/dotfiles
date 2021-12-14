local wezterm = require "wezterm";

return {
  color_scheme = "Dracula",

  keys = {
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action=wezterm.action{CloseCurrentPane={confirm=true}}
    }
  },

  unix_domains = {
    {
      name = "unix",
      connect_automatically = true,
    }
  }
}
