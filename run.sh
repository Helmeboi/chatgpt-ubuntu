#!/bin/bash
apt-get update && apt-get install -y \
  x11vnc xvfb openbox chromium-browser \
  lxterminal pcmanfm geany novnc net-tools curl wget

# Start virtual display
Xvfb :0 -screen 0 1024x768x24 &

# Start Openbox session
openbox-session &

# Start Chromium browser
DISPLAY=:0 chromium-browser --no-sandbox --disable-gpu --start-maximized https://google.com &

# Start VNC server with no password
x11vnc -display :0 -forever -nopw -shared &

# Start noVNC
websockify --web=/usr/share/novnc/ 8080 localhost:5900
