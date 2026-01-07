# Variables
actions=("Area" "Window" "Screen")
sleepTime=0.2

# Building the options list
options=""
for action in ${actions[@]}; do
    if [ -z "$options" ]; then
        options="$action"
    else
        options="$options\n$action"
    fi
done

# Launching Rofi and getting the selected option
selection=$(echo -e "$options" | rofi -dmenu -p "Screen Shot" -class "screen-shot" -theme theme.rasi -mesg "Screenshot  /  Hyprshot")


case "$selection" in
    "${actions[0]}")
        sleep $sleepTime
        hyprshot -zm region --clipboard only
        ;;
    "${actions[1]}")
        sleep $sleepTime
        hyprshot -zm window --clipboard only
        ;;
    "${actions[2]}")
        sleep $sleepTime
        hyprshot -zm output --clipboard only
        ;;
esac

