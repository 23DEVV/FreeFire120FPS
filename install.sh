##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Configuración para evitar el montaje automático
SKIPMOUNT=false

# Cargar el archivo de propiedades del sistema
PROPFILE=true

# Habilitar el script post-fs-data
POSTFSDATA=true

# Habilitar el servicio late_start
LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

# Lista de directorios que se deben reemplazar directamente en el sistema
REPLACE="
/system/priv-app/GameTools
/system/framework
"

##########################################################################################
# Nombre del módulo y mensaje de instalación
##########################################################################################
print_modname() {
  ui_print "*******************************"
  ui_print "    120 FPS for Free Fire      "
  ui_print "          by 23DEVV            "
  ui_print "*******************************"
}

##########################################################################################
# Función para copiar/extraer archivos del módulo
##########################################################################################
on_install() {
  ui_print "- Extrayendo archivos del módulo para Free Fire"
  unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2

  # Realizar limpieza de caché de aplicaciones
  ui_print "- Limpiando caché de paquetes"
  rm -rf /data/system/package_cache/*
  
  # Verificar la versión de Magisk
  if [ "$MAGISK_VER_CODE" -ge 28000 ]; then
    ui_print "- Magisk 28.0 o superior detectado. Aplicando ajustes específicos."
    # Aquí puedes agregar cualquier ajuste específico para la versión 28.0
  else
    ui_print "- Compatibilidad con Magisk 26.1 confirmada."
  fi
}

##########################################################################################
# Función para configurar permisos
##########################################################################################
set_permissions() {
  # Aplicar permisos recursivos a todos los archivos del módulo
  set_perm_recursive "$MODPATH" 0 0 0755 0644
}

##########################################################################################
# Mensajes finales
##########################################################################################
print_modname() {
  ui_print "*******************************"
  ui_print " Instalación completada para  "
  ui_print "      Free Fire by 23DEVV      "
  ui_print "*******************************"
}
