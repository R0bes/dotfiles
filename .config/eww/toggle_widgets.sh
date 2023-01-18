#!/bin/bash

widgets=("$@")

# TODO
# don`t call eww every iteraton

for widget in "${widgets[@]}"; do
    state=$(eww windows | awk '/'$widget'/{print $0}')
    if [[ $state =~ ^\* ]]; then
        eww close $widget
    else
        eww open $widget
    fi
done