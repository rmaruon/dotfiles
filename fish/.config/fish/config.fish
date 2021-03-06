source ~/.config/fish/aliases.fish
source ~/.config/fish/chpwd.fish
source ~/.config/fish/env.fish

# oh-my-fish/theme-bobthefish
set -g fish_prompt_pwd_dir_length 1
set -g theme_color_scheme nord
set -g theme_display_date no
set -g theme_display_git_master_branch yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '

# vi mode
fish_vi_key_bindings
function fish_mode_prompt
end
