# El sol va a terapia
Buenas a quien sea que este leyendo esto. Este es el código fuente de un jueguito hecho en Godot 4.4. Todo el código y demás del juego esta libre de usar como os salga del mismisimo.

Si quereis hacer una versión vuestra sois libres de hacerlo. Ahora bien, no quiero que absolutamente nadie meta esto en cualquier IA generativa. Prefiero afeitarme con una cuchilla oxidada. 

## Lo que encontrarás en el proyecto
El proyecto tiene como base las "Actions". Estas Actions ejecutan lo que sea que se necesite de ellas y la clase "LinealActionSystem" se encarga luego de reproducir cada una de estas acciones en orden secuencial.
Básicamente si quieres usar las acciones ya creadas, crea recursos de esas acciones y arrastralas al LinealActionSystem de la escena "game_scene". Si por lo que sea quieres crear acciones nuevas, tendrás que crear el script que herede de clase Action y ejecutar lo que sea que quieras que ocurra(Y meter en el inyector de dependencias lo que sea que necesites para llevarlo a cabo).

