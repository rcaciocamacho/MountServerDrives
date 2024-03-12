#!/bin/bash

# Directorio de instalación
install_dir="$HOME/.config/remoteMount"

# Crear carpeta remoteMount en el directorio .config si no existe
if [ ! -d "$install_dir" ]; then
    mkdir -p "$install_dir"
    echo "Carpeta remoteMount creada en $install_dir."
fi

# Copiar todos los archivos del directorio actual a la carpeta de instalación
cp -r ./* "$install_dir/"

# Renombra el sample.env a .env.
mv "$install_dir/sample.env" "$install_dir/.env"

# Obtener la ruta del script principal
script_path="$install_dir/mount_server_drives.sh"

# Comprobar si .zshrc existe
zshrc_path="$HOME/.zshrc"
if [ -f "$zshrc_path" ]; then
    # Comprobar si el alias ya está definido en .zshrc
    if grep -q "alias remoteMount" "$zshrc_path"; then
        echo "El alias 'remoteMount' ya está definido en $zshrc_path."
    else
        # Añadir alias al archivo .zshrc
        echo "alias remoteMount='$script_path'" >> "$zshrc_path"
        echo "Alias 'remoteMount' añadido a $zshrc_path."
        echo "Por favor, reinicia tu terminal o ejecuta 'source $zshrc_path' para aplicar los cambios."
    fi
else
    echo "No se encontró el archivo .zshrc en $HOME. No se pudo crear el alias."
fi