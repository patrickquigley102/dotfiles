# Swap ESC and Caps lock back to original values
# This is only required whilst I'm still transitioning from keyboards.
if ! xmodmap -pke | grep -q "9 = Escape NoSymbol Escape"; then
  echo "setting key mappings BACK"
  xmodmap -e "clear Lock"
  xmodmap -e "remove Lock = Caps_Lock"
  xmodmap -e "keycode 66 = Caps_Lock NoSymbol Caps_Lock"
  xmodmap -e "keycode 9 = Escape NoSymbol Escape"
fi

