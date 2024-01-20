### Instructivo para Configurar Apache para una Aplicación Web

Este instructivo proporciona una guía paso a paso para configurar Apache para una aplicación web, enfocándose en la modificación del archivo de configuración de host virtual y la configuración de acceso al directorio.

#### Paso 1: Modificar el Archivo `000-default.conf`

1. **Cambiar el DocumentRoot**:
   - Localice y abra el archivo `000-default.conf` en su editor de texto preferido. Este archivo suele encontrarse en `/etc/apache2/sites-available/`.
   - Busque la línea que contiene `DocumentRoot`.
   - Cambie el valor de `DocumentRoot` a `/var/www/html/public`. Esto especifica que el directorio raíz del documento de su sitio web es `/var/www/html/public`.

     Ejemplo:

     DocumentRoot /var/www/html/public


#### Paso 2: Configurar Acceso al Directorio

1. **Agregar Directiva `<Directory>`**:
   - Dentro del mismo archivo `000-default.conf`, agregue una nueva directiva `<Directory>` para el directorio `/var/www/html/public`.
   - Configure las siguientes opciones dentro de la directiva:
     - `Options -Indexes +FollowSymLinks`: Desactiva la generación de listados de directorio y permite el seguimiento de enlaces simbólicos.
     - `AllowOverride All`: Permite el uso de archivos `.htaccess` para la configuración de directorio.
     - `Require all granted`: Permite el acceso a este directorio desde cualquier origen.

     Ejemplo:

     <Directory /var/www/html/public>
         Options -Indexes +FollowSymLinks
         AllowOverride All
         Require all granted
     </Directory>

#### Paso 3: Guardar y Reiniciar Apache

1. **Guardar los Cambios**:
   - Guarde el archivo `000-default.conf` después de realizar los cambios.

2. **Reiniciar el Servicio Apache**:
   - Para que los cambios surtan efecto, reinicie el servicio Apache. Esto se puede hacer mediante el siguiente comando en la terminal:

     sudo systemctl restart apache2

   
Con estos pasos, habrá configurado correctamente Apache para su aplicación web, estableciendo un `DocumentRoot` personalizado y asegurando el acceso y la reescritura correcta de URL en el directorio especificado.