options="Shutdown\nReboot\nSuspend\nLogout"

# Rofi Command
chosen="$(echo -e "$options" | rofi -dmenu -i -p "󰐥 :")"

case "$chosen" in
  *Shutdown)
    systemctl poweroff
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Suspend)
    systemctl suspend
    ;;
  *Logout)
    # sway: exit the compositor; fall back to killing the session
    swaymsg exit || pkill -KILL -u "$USER"
    ;;
esac
