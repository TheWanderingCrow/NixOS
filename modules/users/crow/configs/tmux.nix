{
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        extraConfig = ''
            bind | split-window -h
            bind - split-window -v
            unbind '"'
            unbind %

            bind -n M-Left select-pane -L
            bind -n M-Right select-pane -R
            bind -n M-Up select-pane -U
            bind -n M-Down select-pane -D
        '';
    };
}
