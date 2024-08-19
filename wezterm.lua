local wezterm = require("wezterm")
local config = {
    font_size = 13,
    font = wezterm.font("FiraCode Nerd Font", {weight = "Regular" }),
    color_scheme = "Catppuccin Mocha",

    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    window_decorations = "RESIZE",
    show_new_tab_button_in_tab_bar = true,
    window_background_opacity = 0.8,
    text_background_opacity = 0.8,
    adjust_window_size_when_changing_font_size = false,
    window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 5,
    },

	-- 默认大小(24, 80)
	initial_cols = 100,
	initial_rows = 30,

}

-- 关闭时不进行确认
-- 对快捷键无效
-- config.window_close_confirmation = "NeverPrompt"

-- 关闭时不进行确认
config.keys = {
  	{
		key = 'w',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.CloseCurrentTab { confirm = false },
	},
}


-- 判断操作系统为Windows
-- if package.config:sub(1,1) == '\\' then
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'pwsh.exe'}

	config.launch_menu = {
		{
			label = 'pwsh',
			args = {'pwsh.exe'},
		},
		{
			label = 'powershell',
			args = {'powershell.exe'},
		},
		{
			label = 'cmd',
			args = {'cmd.exe'},
		},
		{
			label = 'bash',
			args = {'C:/Program Files/Git/bin/bash.exe', '-i', '-l'},
		},
		{
			label = 'zsh',
			args = {'C:/Program Files/Git/usr/bin/zsh.exe', '-i', '-l'},
		},
		{
			label = 'wsl-ubuntu22',
			args = {'wsl.exe', '--distribution', 'Ubuntu-22.04', '--user', 'spirit', '--cd', '~'},
		},
		{
			label = 'VM-Ubuntu24',
			args = {'ssh', 'vm-ubuntu24'},
		},
		{
			label = 'VM-Ubuntu22',
			args = {'ssh', 'vm-ubuntu22'},
		},
		{
			label = '10s-Termux',
			args = {'ssh', '10s-termux'},
		},
	}
end

return config
