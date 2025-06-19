## IMPORTADOR DE TrackIT

### Introducción
Este repositorio es uno de los tres que conforman la aplicación de gestión de música
TrackIT. Esta aplicación permite dejar ratings y reviews de albumes y canciones. Además,
cada usuario puede hacer sus propias listas de canciones (que son privadas), agrupando así las
canciones dependiendo del criterio de cada usuario.

### Este repositorio
Este repositorio en específico es el encargado de insertar la información que no
puede crear un usuario (que son los albumes, las canciones y los artistas).
Esta información se inserta a partir de unos archivos JSON que contienen toda la información
sobre estas entidades (exceptuando las imagenes).

Las imagenes se cogen a partir de la API de Last.fm, por lo que hay archivos de este proyecto
dedicados única y exclusivamente a llamar a la API y coger las imagenes que se necesiten.

**NOTA:** En el archivo hay un directorio llamado database, donde hay un fichero .sql que es el
encargado de crear la base de datos. Este fichero ya tiene los inserts hechos, por lo que si simplemente
se quiere utilizar la app y no modificar nada se puede ejecutar el .sql y ya estaría listo.

### Tecnologías utilizadas
Este proyecto está hecho con Java y se han utilizado Gson, Lombok y JDBC.
La base de datos está hecha con PostgreSQL.