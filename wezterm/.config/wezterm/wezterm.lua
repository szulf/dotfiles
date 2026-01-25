local wezterm = require('wezterm')

local config = {
  color_scheme = 'Afterglow',
  colors = {
    background = '#181818',
  },

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,

  font = wezterm.font('CaskaydiaMonoNerdFont'),
  font_size = 9,

  leader = { key = 'a', mods = 'CTRL' },
  keys = {
    { key = 'a', mods = 'CTRL|LEADER', action = wezterm.action({ SendString = '\x01' }) },
    { key = 'c', mods = 'LEADER', action = wezterm.action({ SpawnTab = 'CurrentPaneDomain' }) },
    { key = '&', mods = 'SHIFT|LEADER', action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
    { key = '1', mods = 'LEADER', action = wezterm.action({ ActivateTab = 0 }) },
    { key = '2', mods = 'LEADER', action = wezterm.action({ ActivateTab = 1 }) },
    { key = '3', mods = 'LEADER', action = wezterm.action({ ActivateTab = 2 }) },
    { key = '4', mods = 'LEADER', action = wezterm.action({ ActivateTab = 3 }) },
    { key = '5', mods = 'LEADER', action = wezterm.action({ ActivateTab = 4 }) },

  },

  launch_menu = {},
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  if string.match(wezterm.hostname(), '^C') then
    config.prefer_egl = true
  end
  table.insert(config.launch_menu, { label = 'PowerShell', args = {'powershell.exe', '-NoLogo'} })
  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in ipairs(wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')) do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(config.launch_menu, {
      label = 'x64 Native Tools VS ' .. year,
      args = {'cmd.exe', '/k', 'C:/Program Files (x86)/' .. vsvers .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat'},
    })
  end
else
  local zsh_bin = '/bin/zsh'
  config.default_prog = { zsh_bin }
  table.insert(config.launch_menu, { label = 'bash', args = {'bash', '-l'} })
  table.insert(config.launch_menu, { label = 'zsh', args = {zsh_bin, '-l'} })
end

return config

