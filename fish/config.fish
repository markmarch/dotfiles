# Little functions
function efish       ; vim ~/.config/fish/config.fish ; end
function evim        ; vim ~/.vimrc                   ; end
function server_this ; python -m SimpleHttpServer     ; end
function ..          ; cd ..                          ; end
function ...         ; cd ../..                       ; end

# open md file with Mou.app
function mou; open -a Mou.app $argv; end

# Short cut to set color
set normal               ( set_color normal)
set yellow               ( set_color yellow)
set red                  ( set_color red)
set blue                 ( set_color blue)
set magenta              ( set_color magenta)
set green                ( set_color green)

# Set jrebel path variable
set -gx JREBEL_PATH "$HOME/.jrebel/jrebel/jrebel.jar"

# Brazil build functions
function bbc; brazil-build clean; end
function bb -d "Brazil build"
    brazil-build $argv
end
function bba; brazil-build apollo-pkg; end

function simple_fish_prompt
  set_color $fish_color_cwd
  echo -n (basename $PWD)
  set_color normal
  echo -n ' > '
end

# envImprovement
function ei -d "Use command in /apollo/env/envImprovement"
    eval /apollo/env/envImprovement/bin/$argv
end

function prepend_to_path -d "Prepend the given dir to PATH"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

set -gx PATH "/usr/X11R6/bin"
prepend_to_path "/apollo/env/envImprovement/bin"
prepend_to_path "/usr/texbin"
prepend_to_path "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/Developer/bin"
prepend_to_path "/apollo/bin"
prepend_to_path "/apollo/env/SDETools/bin"
prepend_to_path "/apollo/env/Git/bin"
prepend_to_path "/usr/local/Cellar/macvim/7.3-66/bin"
prepend_to_path "/usr/local/share/python"
prepend_to_path "/apollo/env/RestClientUtils/bin"
prepend_to_path "/apollo/env/ScalaDev/bin"
prepend_to_path "/apollo/env/eclipse-3.7/bin"

set -g -x fish_greeting ''

set -gx LANG "en_US.utf-8"


function fish_prompt
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
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
  end

  set -l delim '>'

  switch $USER

  case root

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

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end
