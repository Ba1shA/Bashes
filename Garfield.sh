#!/bin/bash
#
# dmenu.sh - Bash Dialog Menu showing some system stats
# Author : Basha
 
# Display menu results in a msgbox
display_result() {
  dialog --title "$1" \
    --backtitle "System Information" \
    --no-collapse \
    --msgbox "$result" 0 0
}
 
while true; do
  selection=$(dialog --stdout \
    --backtitle "System Information" \
    --title "Key Features" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" 0 0 4 \
    "1" "Display Node Information" \
    "2" "Display Disk Space" \
    "3" "Display Memory Stats" \
     )
  exit_status=$?
  if [ $exit_status == 1 ] ; then
      clear
      exit
  fi
  case $selection in
    1 )
      result=$(echo "Hostname: $HOSTNAME"; uptime)
      display_result "System Information"
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
    3 )
      result=$(vmstat --stats)
      display_result "Memory Stats"
      ;;
  esac
done
