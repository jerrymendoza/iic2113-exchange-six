# Exchange-Six

## Basics

Web app en Ruby 2.7 on Rails montado con Docker-Compose. Se puede visualizar en **inserte dominio aqui** donde está montada usando Heroku.
### Docker
    $ docker-compose build
    $ docker-compose up

Si clonas el repositorio por primera vez:
 
    $ docker-compose run web ./bin/setup
El script hará lo siguiente: 
- Instalar dependencias
- Preparar la base de datos

## Buenas Prácticas

### Strong Migrations

Para tener control sobre migraciones y evitar errores de keys en las tablas se usó la gema `strong-migrations` que exige uso de las buenas prácticas descritas en el siguiente manual:
<https://github.com/ankane/strong_migrations#adding-a-reference>
