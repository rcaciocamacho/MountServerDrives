#!/bin/bash

# Cargar variables desde el archivo .env y convertirlas a minúsculas
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "Archivo .env no encontrado."
    exit 1
fi

# Definir arrays para almacenar las variables
remote_names=()
remote_paths=()
local_mount_points=()

# Leer las variables y almacenarlas en los arrays
i=1
while true; do
    remote_name_var="remote_name_$i"
    remote_path_var="remote_path_$i"
    local_mount_point_var="local_mount_point_$i"

    if [ -z "${!remote_name_var}" ] || [ -z "${!remote_path_var}" ] || [ -z "${!local_mount_point_var}" ]; then
        break
    fi

    remote_names+=("${!remote_name_var}")
    remote_paths+=("${!remote_path_var}")
    local_mount_points+=("${!local_mount_point_var}")

    ((i++))
done

# Montar directorios remotos
for ((i = 0; i < ${#remote_names[@]}; i++)); do
    # Montar el directorio remoto usando rclone mount
    umount "${local_mount_points[i]}"
    sshfs "${remote_names[i]}:${remote_paths[i]}" "${local_mount_points[i]}" &
    
    # Esperar un breve periodo para asegurar que el montaje se complete
    sleep 2
done

# Verificar si los montajes fueron exitosos
if [ $? -eq 0 ]; then
    echo "Unidades remotas montadas correctamente."
    notify-send "Unidades remotas montadas correctamente."
else
    echo "Hubo un error al montar las unidades remotas."
    notify-send "Hubo un error al montar las unidades remotas."
fi