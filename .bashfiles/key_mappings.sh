# Swap ESC and Caps lock. If it hasn't already been done.
# I've had a mare trying to run a script on start up.
# This is a workaround.
if ! xmodmap -pke | grep -q "66 = Escape NoSymbol Escape"; then
  echo "setting key mappings"
  xmodmap -e "clear Lock"
  xmodmap -e "remove Lock = Caps_Lock"
  xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
  xmodmap -e "keycode 66 = Escape NoSymbol Escape"
fi

