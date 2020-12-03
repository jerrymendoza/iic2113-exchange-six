# Exchange-Six

## Overview

La aplicación no está montada en un servidor, ya que para esta entrega no era necesario. Lo intentamos, pero preferimos aprovechar el tiempo en las funcionalidades. De igual forma se indica en esta [issue](https://github.com/IIC2113-2020-2/Recursos/issues/95).

## Variables de entorno
Argregar estar variables al archivo `.env.development`  
`ACCOUNTS = ["113", "123"]`  
`URI_CONST = https://bankeleven.herokuapp.com/api/v1/transactions/date`

### Inicialización 

Para poder ejecutar la aplicacion, primero que nada se debe correr:   
`
./bin/setup
`
Al hacer esto recordar guardar el json entregado por el comando, que será utilizado después para la obtención del token.  
Para configurar el proyecto en tu máquina.   
Luego, en otra consola, se debe ubicar dentro de la carpeta que posee la aplicación y correr:  
`
sidekiq
`
Para poder iniciar el proceso de los workers   
Finalmente, para poder correr la aplicación, lo que se debe hacer es ejecutar:   
`
rails s
`

## Funcionalidades logradas

Realizamos todas las funcionalidades pedidas para esta entrega.  
Para la sección de integración con la API, logramos conectarnos a nuestra API (bonus) a través del token del usuario del banco de nuestro repositorio anterior. Esto se hizo en lugar asociarlo a su RUT, ya que para la Entrega 1 y 2 consideramos que este atributo no era necesario agregarlo al modelo, ya que no aportaba información adicional para nuestra aplicación. Esto fue consultado con el ayudante previamente.  

# Funcionamiento de la integración de las API
* Con las credenciales del exchange se crearon 2 cuentas en nuestra aplicación del banco de la entrega anterior, cuyos números de cuenta son 113 y 123.  
* Al momento de crear un usuario en la aplicación de exchange, además de su mail y contraseña, se necesita ingresar un token válido de la aplicación del banco.
* Al ingresar por primera vez a la aplicación de exchange el usuario tendrá 0 CLP en su cuenta, por lo que no podrá hacer ningún cambio de monedas.
* Si el usuario desea tener CLP para cambiar en el exchange, debe ingresar a su cuenta del banco (con el mismo token que se ingresó al crear la cuenta en el exchange) y debe depositar a una de las 2 cuentas del banco (113 o 123) el monto deseado.  
* Una vez realizada la transferencia, se verá reflejado el cambio en su saldo CLP en el exchange.

Con la librería sidekiq cada 3 horas, el precio de venta o compra de las criptomonedas se dispara o cae de forma aleatoria.
No trabajamos en el frontend, ya que no fue estrictamente necesario. Solo trabajamos en el repositorio que se nos fue asignado (backend).

La documentación se encuentra al correr la aplicación localmente. [http://localhost:3000/](http://localhost:3000/)

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


