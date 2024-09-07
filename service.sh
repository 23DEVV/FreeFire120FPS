#!/system/bin/sh

# Aplicar configuraciones de FPS
resetprop persist.sys.display.refresh_rate 120
resetprop persist.game.minfps 120
resetprop persist.game.maxfps 120

echo "120 FPS settings applied for Free Fire"
