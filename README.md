# Exchange-Six

## Overview

API en Ruby 2.7 on Rails montado con Docker-Compose. Se puede visualizar en [api.exchange-six.com](api.exchange-six.com) donde está montada usando Heroku. Ahí se encuentra la documentación completa de consumo de la API.

Puedes encontrar los diagramas UML de Exchange-Six en la carpeta `/docs` de este repositorio.

El frontend de Exchange-Six se visualiza en [exchange-six.com](exchange-six.com). La documentación y código correspondiente al frontend se encuentra en [Exchange-Six Secondary](http://api.exchange-six.com/).

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

## Funcionalidades logradas

- Debe permitir el registro y login de usuarios. :white_check_mark:
- Un usuario debe tener una cuenta :white_check_mark: Esto ocurre en el backend. User y Account son dos entidades separadas aunque para el usuario parezcan una sola. 
- Debe ver cuánto BTF y CLP tiene :white_check_mark:
- Puede ver sus transacciones hechas (compra y venta de BTF). :white_check_mark:
- Por simplicidad en esta entrega, todos los usuarios parten con un valor aleatorio entre los 10.000 CLP y los 100.000 CLP. :white_check_mark:
- Por simplicidad el valor inicial del BTF (o cualquier moneda) y la cantidad será definida por el ayudante al inicio del proyecto. :white_check_mark:
- Los usuarios podrán transar BTF, esto es: :white_check_mark:
- Vender BTF si tienen en su cuenta. Al ejecutar una orden de venta de BTF, el usuario ingresa “cuánto BTF quiere vender” y el precio viene dado por el “precio de venta” del mercado. :white_check_mark:
- Comprar BTF si es que tienen CLP. El ejecutar una orden de compra de BTF, el usuario ingresa “cuánto BTF quiere comprar” y el precio viene dado por el “precio de compra” del mercado. :white_check_mark:
- Los precios de compra y venta serán rangos aleatorios cuyos mínimos y máximos iniciales serán distintos para cada grupo. Luego de cada transacción, el valor de compra y venta se debe actualizar con la siguiente lógica: :white_check_mark:
- Si la transacción es venta, el precio del BTF de compra disminuye en 0.03 sobre el porcentaje de su valor. :white_check_mark:
- Si la transacción es compra, el precio del BTF de venta aumenta en 0.03 sobre el porcentaje de su valor. :white_check_mark:
- Por simplicidad, las transacciones no tienen delay. :white_check_mark:
- Por cada transacción se debe enviar un correo al usuario. :white_check_mark:
- Por simplicidad la cantidad de BTF es constante (ver bonus). :white_check_mark:
- Debe permitir el tipo de cuenta "partner". Este usuario debe poder comprar y vender sin límite (tener saldos negativos) ya que al ser partner, hacen ajustes de cuentas de forma externa (funcionalidad pensada para simplicidad en la entrega 3). :white_check_mark: Decidimos seguir limitando la venta de monedas a la cantidad que tiene porque nos hacía más sentido en la lógica de la aplicación. Un usuario partner de todas formas puede realizar compras sin tener el saldo necesario.
- Debe exponer una API. Cada usuario puede generar su “token” para usar la api. Los usuarios a través de la API podrán: :white_check_mark:
- Obtener los precios actuales de compra y venta en el exchange. :white_check_mark:
- Vender BTF (ejecutar una orden de compra). :white_check_mark:
- Comprar BTF (ejecutar una orden de venta). :white_check_mark:
- Conocer el balance actual de mi cuenta (cuanto BTH y CLP tengo). :white_check_mark:
- Bonus​: Registrar una segunda moneda: Badtherium (BTH2), que permite compra y venta de BTH-CLP. :white_check_mark: