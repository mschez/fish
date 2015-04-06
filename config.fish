# https://github.com/yangchenyun/fish-config

# need a way to auto load these
. "$HOME/.config/fish/functions/export.fish"
. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/utils.fish"
. "$HOME/.config/fish/functions/make_completion.fish"

if test -f "$HOME/.config/fish/users/$USER.fish"
	. "$HOME/.config/fish/users/$USER.fish"
end
