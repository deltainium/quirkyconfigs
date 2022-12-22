# Deltain's twist on Luke's config for the Zoomer Shell
# All functionality I don't use has been removed, or replaced with my preferred variant

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Keep beam shape cursor
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Load aliases and shortcuts if existent.
 [ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
 [ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# CTRL + Backspace will delete word behind cursor
bindkey '^H' backward-kill-word

# CTRL + Arrow keys left/right will jump cursor between words 
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
