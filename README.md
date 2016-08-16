#Docker redmine
Contenedor de docker que extiende la imagen de redmine:3.3-passenger. Con este contenedor se podrá levantar la versión 3.3 de redmine con passenger, en la cual se podrán agregar los plugins que se deseen.

#Uso

Este contenedor levanta la aplicación en el puerto 3000. Para agregar plugins al contenedor se debe definir una variable de entorno llamada 'PLUGINS'.
Esta variable PLUGINS debe ser una lista con los plugins que se quieren instalar. Esta lista de plugins se debe definir de la siguiente manera: el primer campo es el repositorio en donde se encuentra el plugin y el segundo campo es el directorio en donde se instalará el plugin.
    repositorio_git_plugin plugins/nombre_plugin

```
docker run -p 3000:3000 -d -e "PLUGINS=git://github.com/alexandermeindl/redmine_tweaks.git plugins/redmine_tweaks" mikroways/redmine

```

Para obtener los scripts pasados a través de esta variable se creó un script(plugins.sh) en el cual se recorre esta lista de plugins y se pasa a clonar el repositorio en el directorio adecuado.

Se crearon dos scripts: start.sh y plugins.sh. El script start.sh es un Entrypoint en el cual se ejecuta primero el script para descargar los plugins(plugins.sh) y luego llama a docker-entrypoint.sh con los parametros adecuados. Este docker-entrpoint.sh es el Entrypoint que ejecuta la imagen de redmine passenger en el cual se termina de configurar el contenedor.


#Configuración de Email

Para la configuración del envío de emails se utiliza un template en el cual se definen una serie de variables de entorno, las cuales pueden ser definidas para especificar la configuración que se desee.

Lista de variables: 
        - SECRET_TOKEN
        - DELIVERY_METHOD
        - ADDRESS
        - PORT
        - AUTHENTICATION
        - DOMAIN
        - USER_NAME
        - PASSWORD
        - STARTTLS_AUTO

Ejemplo con docker compose
```
redmine:
    container_name: redmine
    image: Mikroways/redmine
    environment:
        SECRET_TOKEN: you-secret-token 
        DELIVERY_METHOD: async_smtp_example
        ADDRESS: smtp.googlemail.com
        PORT: port
        AUTHENTICATION: :login
        DOMAIN: your-domain.com
        USER_NAME: name@your-domain.com
        PASSWORD: your-password
        STARTTLS_AUTO: 'true'
        
```
