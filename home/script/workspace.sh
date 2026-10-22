items=""
tree_json=$(swaymsg -t get_tree)

for i in 1 2 3 4 5 6 7 8 9 10; do
  app=$(echo "$tree_json" | jq -r --argjson ws "$i" '
    .. | objects | select(.type? == "workspace" and .num == $ws) |
    .. | objects | select(.type? == "con" or .type? == "floating_con") |
    select(.app_id? or .window_properties?.class? or (.name? and .pid?)) |
    .app_id // .window_properties.class // .name // empty
  ' | head -n 1)

  if [ -n "$app" ]; then
    items="${items}${i}: ${app}\n"
  else
    items="${items}${i}\n"
  fi
done

choice=$(printf "%b" "$items" | rofi -dmenu -p "󰍹 " -theme-str 'listview { lines: 10; }')

[ -z "$choice" ] && exit 0

ws=$(echo "$choice" | cut -d':' -f1)

swaymsg workspace number "$ws"
