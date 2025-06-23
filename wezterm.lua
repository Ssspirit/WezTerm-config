local wezterm = require("wezterm")
local config = {
    font_size = 13,
    font = wezterm.font("FiraCode Nerd Font", {weight = "Regular" }),
--    color_scheme = "Catppuccin Mocha",
    color_scheme = 'Dracula (Official)',
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,

    hide_tab_bar_if_only_one_tab = false,
    window_decorations = "RESIZE",
    show_new_tab_button_in_tab_bar = true,
    window_background_opacity = 0.9,
    text_background_opacity = 0.9,
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
			label = 'msys2',
			args = {'msys2_shell.cmd', '-defterm', '-no-start', '-use-full-path', '-here', '-mingw64'}
		},
		{
			label = 'wsl-ubuntu22',
			args = {'wsl.exe', '--distribution', 'Ubuntu-22.04', '--user', 'spirit', '--cd', '~'},
		},
		{
			label = 'wsl-ubuntu24',
			args = {'wsl.exe', '--distribution', 'Ubuntu-24.04', '--user', 'spirit', '--cd', '~'},
		},
		{
			label = 'GXDE-e450',
			args = {'ssh', 'gxde-e450'},
		},
		{
			label = 'aliyun-ubuntu24',
			args = {'ssh', 'aliyun-ubuntu24'},
		},
		{
			label = '10s-Termux',
			args = {'ssh', '10s-termux'},
		},
	}
end

return config
