#################################
### Network Related
#################################

alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

function server --description "Start an HTTP server from a directory"
  open http://localhost:8080/
  and python -m SimpleHTTPServer 8080
end

# function httpcompression
  # curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' $argv | grep '^Content-Encoding:'
  # and echo "$argv is encoded using ${encoding#* }"
  # or echo "$argv is not using any encoding"
# end

function digga --description "All the dig info"
  dig +nocmd $argv[1] any +multiline +noall +answer
end

alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"

alias listening="lsof -i | grep LISTEN"

################################
###  Unix Related
################################
# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function md
  mkdir -p "$argv"; cd "$argv"
end

function randpw --description "generate a random password"
  dd if=/dev/urandom bs=1 count=16 2>/dev/null | base64 | rev | cut -b 2- | rev
end

function cdd --description "auto ls for each cd"
  if [ -n $argv[1] ]
    builtin cd $argv[1]
    and ls -AF
  else
    builtin cd ~
    and ls -AF
  end
end

################################
###  Mac OS Related
################################
# Flush Directory Service cache
alias __flush="dscacheutil -flushcache"

# Empty the Trash
alias __emptytrash="rm -rfv ~/.Trash"

# Recursively delete `.DS_Store` files
alias __cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias __show="defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder"
alias __hide="defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias __hidedesktop="defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
alias __showdesktop="defaults write com.apple.finder CreateDesktop -bool true and killall Finder"

# Disable Spotlight
alias __spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias __spoton="sudo mdutil -a -i on"

# Upgrade brew cask
function cask_upgrade --description "Upgrade cask packages"
  # rm -rf (brew --cache)
  # brew update
  for app in (brew cask list)
    brew cask uninstall "$app"
    brew cask install --force "$app"
  end
end

# Update the whole ecosystem
function upgrade --description "Upgrade packages from brew, gem, npm"
  echo "> upgrade brew"
  rm -rf (brew --cache)
  brew update; and brew upgrade
  echo "> upgrade brew cask"
  cask_upgrade
  echo "> upgrade gem"
  gem update
  echo "> upgrade npm"
  npm -g update
end
