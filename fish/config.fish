# Little functions
function efish; vim ~/.config/fish/config.fish; end
function evim;  vim ~/.vimrc; end

function fish_prompt
  set_color $fish_color_cwd
  echo -n (basename $PWD)
  set_color normal
  echo -n ' > '
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
prepend_to_path "/usr/local/Cellar/macvim/7.3-66/bin"
prepend_to_path "/usr/local/share/python"

set -g -x fish_greeting ''
set -g -x EDITOR vim

set -gx LANG "en_US.utf-8"
