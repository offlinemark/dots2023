source ~/.aliases
source ~/.abbr.fish
source ~/.fishrc.local

fish_hybrid_key_bindings

export NNN_PLUG="o:fzopen;c:fzcd;j:autojump;p:preview-tui"

# -g because i don't want it to modify the universal fish_variables state which
# makes my path config non declarativej
fish_add_path -g ~/bin
fish_add_path -g /opt/homebrew/bin
fish_add_path -g /Users/mark/Library/Python/3.10/bin

set -g -x TK_SILENCE_DEPRECATION 1
set -g -x BAT_THEME "Solarized (light)"
#set -g -x NO_COLOR 1
set -g -x EDITOR vim
set -g -x CMAKE_COLOR_DIAGNOSTICS ON
set -g -x fish_greeting ""

# only needed for fish_git_prompt
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showupstream auto
set -g __fish_git_prompt_showcolorhints 1

#eval (python3 -m virtualfish)

# [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# pyenv
#status is-login; and pyenv init --path | source
#status is-interactive; and pyenv init - | source

function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end
