# Documentación del Proyecto remoteMount

## Descripción
El proyecto remoteMount es un conjunto de scripts en Bash diseñados para montar unidades remotas utilizando rclone. Incluye un script principal para montar unidades remotas basado en configuraciones proporcionadas en un archivo `.env`, y un script de configuración para facilitar la instalación y configuración del proyecto en el sistema del usuario.

## Estructura del Proyecto
El proyecto está estructurado de la siguiente manera:
- `mount_server_drives.sh`: Script principal para montar unidades remotas.
- `setup.sh`: Script de instalación para configurar el proyecto en el sistema del usuario.
- `.env`: Archivo de configuración que contiene las variables necesarias para montar las unidades remotas.
- `README.md`: Documentación del proyecto en formato Markdown.

## Requisitos
- sshfs debe estar instalado en el sistema.
- Se debe tener acceso a las unidades remotas que se desean montar.
- Es necesario tener permisos de administrador para montar unidades en el sistema de archivos.

## Instalación
1. Clonar o descargar este repositorio en el sistema.
2. Ejecutar el script `setup.sh` en el directorio donde se encuentra para realizar la instalación y configuración del proyecto.
3. Configurar las variables necesarias en el archivo `.env` según las unidades remotas que se deseen montar.

## Uso
Una vez que el proyecto está instalado y configurado, se puede utilizar de la siguiente manera:
1. Editar el archivo `.env` para especificar las unidades remotas que se desean montar, así como las rutas locales de montaje.
2. Ejecutar el script principal `mount_server_drives.sh` para montar las unidades remotas según la configuración proporcionada en el archivo `.env`.
3. Verificar que las unidades remotas se han montado correctamente.

## Ejemplo de Archivo `.env`
```plaintext
# Directorio remoto 1
remote_name_1="<usuario@ip> or <ssh alias>"
remote_path_1="<remote-path>"
local_mount_point_1="<local-paht>"
```