# Fish: Config
This project add some fish features and configurations

### Usage
For usage fish I recommend use [iterm2](http://iterm2.com/). iTerm2 is a replacement for Terminal licensed under [GPL v2](http://iterm2.com/license.txt).

* Install fish shell

	```
	brew install fish
	```

* Type in your terminal

	```
	mkdir ~/.config
	cd ~/.config
	```

* Clone fish

	```
	git clone https://github.com/mschez/fish.git
	```
	
Now we set fish like as default shell on mac:

* Add `/usr/local/bin/fish` in  `/etc/shell`

	```
	sudo vim /etc/shell
	```
	Should be:
	
	```
	# List of acceptable shells 	for chpass(1).
	# Ftpd will not allow users to 	connect who are not 	using
	# one of these shells.

	/bin/bash
	/bin/csh
	/bin/ksh
	/bin/sh
	/bin/tcsh
	/bin/zsh
	/usr/local/bin/fish
	```
* Type

	```
	chsh -s /usr/local/bin/fish
	```

* Finally restart you terminal

### Configuration
You can configurate fish for your shell user. In users folder (now, there are two example users, you can delete it), you can add an file with your shell username.
