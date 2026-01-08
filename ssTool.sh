# Theme
theme=theme.rasi

# Variables
classText="screen-shot"
msg="Screenshot  /  Hyprshot"
actions=("Area" "Window" "Screen")
sleepTime=0.2
declare -A icons

icons["Area"]=""
icons["Window"]=""
icons["Screen"]="󰹑"

# Building the options list
options=""
for action in ${actions[@]}; do
    if [ -z "$options" ]; then
        options="${icons[$action]}"
    else
        options="$options\n${icons[$action]}"
    fi

done

echo ${icons[${actions[0]}]}

# Launching Rofi and getting the selected option
selection=$(echo -e "$options" | \
    rofi -dmenu\
        -class "$classText"\
        -theme $theme\
        -mesg "$msg")


case "$selection" in
    "${icons[${actions[0]}]}")
        sleep $sleepTime
        hyprshot -zm region --clipboard only
        ;;
    "${icons[${actions[1]}]}")
        sleep $sleepTime
        hyprshot -zm window --clipboard only
        ;;
    "${icons[${actions[2]}]}")
        sleep $sleepTime
        hyprshot -zm output --clipboard only
        ;;
esac

