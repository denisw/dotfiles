-- completion.lua:
-- Plugins and configuration for auto-completion.

return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "super-tab" },
    },
  },
}
