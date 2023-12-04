#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

#|Función principal para registrar un Libro en una Biblioteca|#
(defun registrarLibros()
    ;Verificar que exista al menos una Biblioteca
    (cond ((eq 0 (aref vecBibliotecas 0))
		(print "No hay Bibliotecas registradas.")
		(return-from registrarLibros NIL)
	))
    ;Mostrar Bibliotecas disponibles
    (format t "~%Bibliotecas disponibles:~%")
    (imprimirBibliotecas)
    ;Asociar Libro a una Biblioteca
    (print "Selecciona la Biblioteca donde deseas registrar el Libro: ")
    (loop
        (setq opcion(validarEntero))
        (if (or (= opcion 1) (= opcion 2))
            (return)
            (format t "Digite una opcion valida. Por favor, intente de nuevo: "))
    )
    ;Posición de la Biblioteca seleccionada
    (setq posBib (aref vecBibliotecas (- opcion 1)))
    ;Referencia a los Libros de la Biblioteca seleccionada (vecLibros)
    (setq refLibros (Biblioteca-libros posBib))
    ;Sí la última posición del vector de Libros está disponible
    (cond ((eq 0 (aref refLibros 2))
        ;Instancia de Libro
        (setq lib (make-Libro))
        ;Solicitar datos del Libro
        (llenarDatosLibro lib)
        ;Verificar sí ya hay un 0 para registrar el Libro
        (setq pos 0)	
        (loop
            ;Sí hay un 0, el Libro se registra
            (cond ((equal 0 (aref refLibros pos)) 
                (setf (aref refLibros pos) lib)
                (return)
            ))
            (setq pos (+ 1 pos))
            (when (>= pos LIBROS_SIZE) (return))	           
        )
        (return-from registrarLibros NIL)
	))
)
#|Función secundaria para la creación de Libros, 
    se solicita la información necesaria para un Biblioteca|#
(defun llenarDatosLibro(lib)
    (print "Digite el codigo del Libro: ")
    (setf (Libro-codigo lib)(read))
    (print "Digite el nombre del Libro: ")
    (setf (Libro-titulo lib)(read))
    ;Solicitar una categoria valida
    (asociarCategoria lib)
    (print "Libro registrado con exito!")
)
#|Función para la asignacion de la categoria a un Libro, 
    se solicita la información necesaria para una categoria|#
(defun asociarCategoria(lib)
    (format t "Digite la categoria del Libro (DRAMA, SUSPENSO, AVENTURA): ~%")
    ;Pedir al usuario que ingrese una categoría hasta que sea válida
    (loop
        (setq inCategoria (read))
        ;:test especifica que se utilizará una función de comparación personalizada
        ;#'string= es la función que se utiliza (string=) para comparar dos cadenas de texto
        (if (member inCategoria categorias :test #'string=)
            (progn (setf (Libro-categoria lib) inCategoria) (return))
            (format t "Categoria no valida. Intente de nuevo:~%")
        )
    )
)