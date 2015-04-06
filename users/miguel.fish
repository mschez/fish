# config for miguel

alias conf="open ~/.config/fish -a /Applications/Sublime\ Text.app/"
alias gobra="cd ~/Dev/brahma"
alias gobab="cd ~/Dev/babyphone/"
alias gochef="cd ~/Dev/chefcito/"

set -x PATH "$HOME/android-sdk-macosx/tools" "$HOME/android-sdk-macosx/platform-tools" $PATH

set -x PATH $PATH "$HOME/Development/Java/activator"

set -x ANDROID_SDK_HOME "$HOME/.android"
set -x JAVA_HOME (/usr/libexec/java_home -v 1.7)
