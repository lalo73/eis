# [10 Articles Every Programmer Must Read](http://www.javacodegeeks.com/2014/05/10-articles-every-programmer-must-read.html)


Tarea:
* Leer el articulo citado arriba
* Dar su opinion sobre cada uno de los puntos,  respuestas explícitas a cada punto.


## * [What Every Programmer Should Know about Memory](http://www.akkadia.org/drepper/cpumemory.pdf)

El articulo es interesantisimo como programador, pero la utilidad del mismo en tu dia a dia de trabajo
se ve limitado. Por ejemplo, si te dedicas a desarrollar web, ¿De que utilidad es saber esta informacion?
Con lenguajes de alto nivel (ruby, python, java, etc.) que te abstraen de ese manejo de memoria, ¿Cuanto es el uso que le podes dar?
No digo que no sea importante saber lo que el articulo muestra, sino que se puede vivir con el conocimiento basico, a menos que tu trabajo este relacionado, como dice el articulo, en hacer aplicaciones de alto rendimiento (__"writing high performance application"__).

## * [What Every Computer Scientist Should Know About Floating-Point Arithmetic](http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)

Este articulo me parecio tocar un topico bastante interesante. Hace ya un tiempo recuerdo hacer querido manejar un campo monetario y (por ignorancia) haber puesto un float.
Por suerte uno de mis compañeros lo noto y me corrigio.
Por lo que vi rapidamente del articulo, me parecio un poco duro por los teoremas, y no tan explicatico como te lo describe el breve resumen de Javin Paul, aunque en su dureza puedas deducir las razones.
Saber como manejar punto flotantes es importante, saber que 0.01 + 0.09 jamas va a dar 0.1, al menos en python.

## * [What Every Developer Should know about Unicode](http://www.joelonsoftware.com/articles/Unicode.html)

Este es uno de los articulos que leere cuando pueda hacerme un tiempo. Unicode y "encoding" son cosas que me cruzo regularmente, mas no todos los dias, en el trabajo. Y siempre me quedo la duda de que es y como usarlo realmente.

## * [What Every Programmer Should know about Time](http://unix4lyfe.org/time/?v=1)

Un lenguaje de alto nivel bastante moderno, te abstrae bastante del manejo del tiempo incluso transfomando de un Timezone a otro. Pero aun asi, es un tema para conocer.
Recuerdo hace un tiempo que en un proyecto teniamos que disparar un proceso a las 8 de la noche, hora argentina, y que tuvimos que tener en cuenta donde estaba la maquina de heroku para poder hacer eso. Interesante articulo, corto para leer y buena info para tener en cuenta.

## * [What every web developer must know about URL encoding](http://blog.lunatech.com/2009/02/03/what-every-web-developer-must-know-about-url-encoding)

Este es otro de los articulos que _debo_ leer. Varias veces a llegado el cliente queriendo cambiar las urls del sitio, con tratando de meter fitros en la url, donde (si se deja sin control) podria meterse cualquier caracter y obtener valores distintos a los deseados. o mismo de pasar de parametros de _query_ a ser parte del path me tope con cosas que no son validas si no estan encodeadas.
Incluso de generacion, tanto por codigo ruby como por javascript, diferian.
Muy util este articulo.

## * [What should every programmer know about web development?](http://programmers.stackexchange.com/questions/46716/what-technical-details-should-a-programmer-of-a-web-application-consider-before)

La respuesta a la pregunta en programmers.stackexchange.com es de mucha utilidad para mi. Al trabajar en desarrollo web, muchas de las cosas que menciona la respuesta las conozco de oidas, pero otras las ignoro (como SEO o User experience). Ciertamente este es uno de los articulos que _debo_ tomarme el tiempo para leer.

## * [What Every Programmer Should Know About SEO](http://katemats.com/what-every-programmer-should-know-about-seo/)

Este es un articulo que seguramente debi leer antes de lidiar con el equipo de SEO de
un cliente. Los cambios de urls, la generacion de las mismas, filtros, tags, slugs, siemaps, son cosas que por ahi no agregan mucha funcionalidad y capaz se vean como cosas molestas (sobre todo de implementar despues de tener el sitio en produccion), pero aumentan mucho la visibilidad del sitio, mas cuando es una pagina de e-commers. Saber lo basico de como funciona, y las buenas practicas puede incluso a
entender/implementar de principio brindando un mejor producto.
Otro articulo que leere detenidamente cuando tenga un minuto.

## * [What Every C Programmer Should Know About Undefined Behaviour #1/3](http://blog.llvm.org/2011/05/what-every-c-programmer-should-know.html)

Es la primera vez que leo acerca del concepto de "Undefined Behaviour". No sabria
que opinar sobre este topico hasta despues de leer el articulo.

## * [What Every Programmer Need to know about networking](http://gafferongames.com/networking-for-game-programmers/what-every-programmer-needs-to-know-about-game-networking/)

Al leer el resumen, me parecio tendencioso el titulo de "What Every Programmer Need to know about networking", ya que no todos terminamos trabajando con videojuegos y menos
con videojuegos multi-player. Si bien lo encuentro interesante de leer, no esencial y capaz sobra en la lista, en mi humilde opinion.
