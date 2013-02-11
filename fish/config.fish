# Little functions
function efish       ; vim ~/.config/fish/config.fish ; end
function evim        ; vim ~/.vimrc                   ; end
function server_this ; python -m SimpleHttpServer     ; end
function ..          ; cd ..                          ; end
function ...         ; cd ../..                       ; end

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
prepend_to_path "/usr/texbin"
prepend_to_path "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/Developer/bin"
prepend_to_path "/apollo/env/SDETools/bin"
prepend_to_path "/usr/local/Cellar/macvim/7.3-66/bin"
prepend_to_path "/usr/local/share/python"

set -g -x fish_greeting ''

set -gx LANG "en_US.utf-8"

# Set LD_LIBRARY_PATH
# set -gx LD_LIBRARY_PATH '/usr/local/lib'

function fish_prompt; simple_fish_prompt; end
