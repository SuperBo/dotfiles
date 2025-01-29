#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

# WIFI=${INFO:-"Not Connected"}

# sketchybar --set $NAME label="${WIFI}"

# INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"

update() {
  # CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I)"
  # SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
  # CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

  # SSID="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"
  SSID=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')

  if [ "$SSID" = "" ]; then
    sketchybar --set $NAME label="Disconnected" icon=󰖪
  else
    sketchybar --set $NAME label="$SSID" icon=󰖩
    # sketchybar --set $NAME.details label="$SSID (${CURR_TX}Mbps)"
  fi
}

popup() {
  sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
  "routine"|"forced"|"wifi"|"wifi_change") update
  ;;
  # "mouse.entered") popup on
  # ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  "mouse.clicked") popup toggle
  ;;
esac
