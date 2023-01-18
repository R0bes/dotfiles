if status is-interactive
    # Commands to run in interactive sessions can go here

    # disable welcome message
    set fish_greeting ""

    # set aliases
    source ~/.config/.my_alias

    # run neofetch (initial image)
    neofetch

    # run starship prompt
    eval (starship init fish)

end
