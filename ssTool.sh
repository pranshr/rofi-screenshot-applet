actions=("Area" "Window" "Screen")
sleepTime=0.1

options=""
for action in ${actions[@]}; do
    if [ -z "$options" ]; then
        options="$action"
    else
        options="$options\n$action"
    fi
done

echo $sleepTime
selection=$(echo -e "$options" | rofi -dmenu -p "Screen Shot" -class "screen-shot")

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

