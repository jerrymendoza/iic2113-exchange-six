# Exchange-Six

## Overview

API en Ruby 2.7 on Rails montado con Docker-Compose. Se puede visualizar en [api.exchangesix.com](api.exchangesix.com) donde está montada usando Heroku. Ahí se encuentra la documentación completa de consumo de la API.

Puedes encontrar los diagramas UML de Exchange-Six en la carpeta `/docs` de este repositorio.

El frontend de ExchangeSix se visualiza en [exchangesix.com](exchangesix.com). La documentación y código correspondiente al frontend se encuentra en [Exchange-Six Secondary](http://api.exchangesix.com/).

### Inicialización con Docker

    docker-compose build

Si clonas el repositorio por primera vez:

    docker-compose run web ./bin/setup

Finalmente:

    docker-compose up


El script hará lo siguiente:  

- Instalar dependencias
- Preparar la base de datos

## Deployment en Heroku

Para hacer deploy de la app mediante heroku, tras las configuraciones iniciales, se corren las siguientes líneas en la consola de heroku.

    heroku container:push web

    heroku container:release web

### Configuración Mailer

Adicionalmente, para permitir el funcionamiento del __mailer__ implementado, se deben configurar las siguientes variables de entorno:

    EMAIL=<tu_email@dominio.com>

    EMAIL_PW=<tu_clave>

donde \<tu_email@dominio.com> y <tu_clave> son las credenciales de la cuenta gmail que enviará los mails notificando de transacciones (nosotros los agregamos en development a nuestro archivo `.env`).

Para más detalles de cómo configuramos el mailer, revisa el [tutorial que seguimos](https://dev.to/morinoko/sending-emails-in-rails-with-action-mailer-and-gmail-35g4).


## Buenas Prácticas

### Strong Migrations

Para tener control sobre migraciones y evitar errores de keys en las tablas se usó la gema `strong-migrations` que exige uso de las buenas prácticas descritas en el siguiente manual:
<https://github.com/ankane/strong_migrations#adding-a-reference>