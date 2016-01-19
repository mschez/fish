# config for miguel

alias opconf="open ~/.config/fish -a /Applications/Sublime\ Text.app/"
alias godev="cd ~/Development/Projects"
$PATH

set -x PATH $PATH "$HOME/Development/Java/activator"

# android sdk
set -x PATH "/Users/$USER/Library/Android/tools/" $PATH
set -x PATH "/Users/$USER/Library/Android/platform-tools/" $PATH

set -x ANDROID_SDK_HOME "/Users/$USER/Library/Android/"
set -x ANDROID_AVD_HOME "/Users/$USER/.android/avd/"

set -x JAVA_HOME (/usr/libexec/java_home -v 1.7)
