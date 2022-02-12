while bspc subscribe -c 1 node_focus; do 
    bspc config border_width 0
    bspc config -n focused border width 5 
done
