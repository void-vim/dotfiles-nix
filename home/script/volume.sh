# usage: ./volume.sh up|down|mute

# change volume
case "$1" in
  up)
    pamixer --increase 5
    ;;
  down)
    pamixer --decrease 5
    ;;
  mute)
    pamixer --toggle-mute
    ;;
  *)
    echo "Usage: $0 up|down|mute"
    exit 1
    ;;
esac

# get status
vol=$(pamixer --get-volume-human)

if [ "$vol" = "muted" ]; then
  notify-send -a "Volume" "🔇 Muted" -h string:x-canonical-private-synchronous:volume
else
  # strip '%' and ensure it’s numeric for the hint
  vol_num=$(pamixer --get-volume)
  notify-send -a "Volume" "󰕾 Volume: ${vol_num}%" \
    -h int:value:"$vol_num" \
    -h string:x-canonical-private-synchronous:volume \
    -t 1000
fi
