function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  # see functions/z.fish
  z --add "$PWD"

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1|head -c 6)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_git --on-variable fish_color_git --description "Event handler, repaint when fish_color_git changes"
      if status --is-interactive
        set -e __fish_prompt_git
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_date --on-variable fish_color_date --description "Event handler; repaint when fish_color_date changes"
      if status --is-interactive
        set -e __fish_prompt_date
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '$'

  switch $USER

  case root

  	set -l delim '#'
    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end
  if not set -q __fish_prompt_git
    set -g __fish_prompt_git (set_color $fish_color_git)
  end
  if not set -q __fish_prompt_date
    set -g __fish_prompt_date (set_color $fish_color_date)
  end
  if not set -q __fish_prompt_symbol
    set -g __fish_prompt_symbol (set_color $fish_color_symbol)
  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  else
  	set prompt_status "$__fish_prompt_symbol"
  end

  echo -n -s "$__fish_prompt_user" "$USER": ' ' "$__fish_prompt_host" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_git" (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" ' ' "$delim" ' '

end

# initialize our new variables
# in theory this would be in a fish_prompt event, but this file isn't sourced
# until the fish_prompt function is called anyway.

set -U fish_color_user 00ffff
set -U fish_color_cwd 00F580
set -U fish_color_host green
set -U fish_color_date bbbbbb
set -U fish_color_git yellow
set -U fish_color_symbol bbbbbb
set -U fish_color_status red
