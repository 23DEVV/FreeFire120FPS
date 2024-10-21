#!/system/bin/sh
# Script para verificar y habilitar el Wi-Fi

# Definir la ubicación del archivo de log en la carpeta de Descargas
LOG_FILE="/sdcard/Download/wifi_status_log.txt"

# Reiniciar el archivo de log al iniciar el dispositivo
echo "===== Reinicio de log =====" > "$LOG_FILE"
echo "Log reiniciado en: $(date)" >> "$LOG_FILE"

# Verificar el estado actual del Wi-Fi
wifi_status=$(dumpsys wifi | grep "Wi-Fi is" | awk '{print $3}')

# Registrar el estado del Wi-Fi en el log
echo "Estado del Wi-Fi detectado: $wifi_status" >> "$LOG_FILE"

# Control del Wi-Fi: Encender si está apagado
if [ "$wifi_status" = "disabled" ]; then
    # Si el Wi-Fi está apagado, encenderlo
    svc wifi enable
    echo "Wi-Fi estaba apagado, se ha habilitado." >> "$LOG_FILE"
else
    echo "Wi-Fi ya estaba habilitado." >> "$LOG_FILE"
fi

# Agregar un mensaje para indicar que el script ha finalizado
echo "===== Control del Wi-Fi Finalizado =====" >> "$LOG_FILE"


