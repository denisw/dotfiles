-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nï\1\0\0\6\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\3\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\5\5>\5\2\4=\4\b\3B\1\2\1K\0\1\0\fsources\1\0\0\16diagnostics\veslint\17code_actions\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimõ\5\1\2\t\0\28\0n5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\1K\0\1\0\0\14<leader>F\16code_action\15<leader>ca\vrename\15<leader>cr\20type_definition\14<leader>D\19signature_help\n<C-k>\15references\agr\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\vsilent\2\fnoremap\2≤\1\1\0\4\0\v\0\0246\0\0\0'\2\1\0B\0\2\0027\0\1\0003\0\2\0006\1\1\0009\1\3\0019\1\4\0015\3\5\0=\0\6\3B\1\2\0016\1\1\0009\1\a\0019\1\4\0015\3\b\0=\0\6\3B\1\2\0016\1\1\0009\1\t\0019\1\4\0015\3\n\0=\0\6\3B\1\2\1K\0\1\0\1\0\0\18rust_analyzer\1\0\0\rtsserver\14on_attach\1\0\0\nsetup\fpyright\0\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nê\2\0\0\a\0\14\0$6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\1K\0\1\0\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\n<C-p>\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-one",
    url = "https://github.com/rakr/vim-one"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-better-whitespace
time([[Setup for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\n∫\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\6\0\0\tdiff\14gitcommit\nunite\aqf\thelp*better_whitespace_filetypes_blacklist\29strip_whitespace_confirm\29strip_whitespace_on_save\6g\bvim\0", "setup", "vim-better-whitespace")
time([[Setup for vim-better-whitespace]], false)
time([[packadd for vim-better-whitespace]], true)
vim.cmd [[packadd vim-better-whitespace]]
time([[packadd for vim-better-whitespace]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimõ\5\1\2\t\0\28\0n5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\1K\0\1\0\0\14<leader>F\16code_action\15<leader>ca\vrename\15<leader>cr\20type_definition\14<leader>D\19signature_help\n<C-k>\15references\agr\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\vsilent\2\fnoremap\2≤\1\1\0\4\0\v\0\0246\0\0\0'\2\1\0B\0\2\0027\0\1\0003\0\2\0006\1\1\0009\1\3\0019\1\4\0015\3\5\0=\0\6\3B\1\2\0016\1\1\0009\1\a\0019\1\4\0015\3\b\0=\0\6\3B\1\2\0016\1\1\0009\1\t\0019\1\4\0015\3\n\0=\0\6\3B\1\2\1K\0\1\0\1\0\0\18rust_analyzer\1\0\0\rtsserver\14on_attach\1\0\0\nsetup\fpyright\0\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nê\2\0\0\a\0\14\0$6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\1K\0\1\0\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\n<C-p>\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nï\1\0\0\6\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\3\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\5\5>\5\2\4=\4\b\3B\1\2\1K\0\1\0\fsources\1\0\0\16diagnostics\veslint\17code_actions\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'G' }, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Git', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git' }, _G.packer_plugins)
          return vim.fn.getcompletion('Git ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gdiffsplit', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gdiffsplit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gdiffsplit' }, _G.packer_plugins)
          return vim.fn.getcompletion('Gdiffsplit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gread', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gread', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gread' }, _G.packer_plugins)
          return vim.fn.getcompletion('Gread ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gwrite', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gwrite', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gwrite' }, _G.packer_plugins)
          return vim.fn.getcompletion('Gwrite ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Ggrep', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Ggrep', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Ggrep' }, _G.packer_plugins)
          return vim.fn.getcompletion('Ggrep ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GMove', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GMove', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'GMove' }, _G.packer_plugins)
          return vim.fn.getcompletion('GMove ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GDelete', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GDelete', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'GDelete' }, _G.packer_plugins)
          return vim.fn.getcompletion('GDelete ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GBrowse', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GBrowse', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'GBrowse' }, _G.packer_plugins)
          return vim.fn.getcompletion('GBrowse ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GRemove', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRemove', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRemove' }, _G.packer_plugins)
          return vim.fn.getcompletion('GRemove ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GRename', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRename' }, _G.packer_plugins)
          return vim.fn.getcompletion('GRename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glgrep', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Glgrep', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Glgrep' }, _G.packer_plugins)
          return vim.fn.getcompletion('Glgrep ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gedit', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gedit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gedit' }, _G.packer_plugins)
          return vim.fn.getcompletion('Gedit ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType fugitive ++once lua require("packer.load")({'vim-fugitive'}, { ft = "fugitive" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/denis/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], true)
vim.cmd [[source /Users/denis/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]]
time([[Sourcing ftdetect script at: /Users/denis/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
