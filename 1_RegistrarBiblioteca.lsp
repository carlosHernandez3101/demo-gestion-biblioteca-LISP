#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

(crearEstructuras)
#|Función principal para la creación de las Bibliotecas (Máximo 2)|#
(defun registrarBiblioteca()
    ;Instancia de Biblioteca
    (setq bib (make-Biblioteca))
    ;Agregar la Biblioteca al vector de Bibliotecas
    (cond ((eq 0 (agregarBiblioteca bib))
        ;Solicitar los datos al Usuario
        (print "Espacio disponible!") (llenarDatosBiblioteca bib))
        ;Mensaje para el caso en que el vector está con 2 Bibliotecas
        ((print "No se puede exceder el limite de dos Bibliotecas registradas en el sistema."))
    )
    ;Verificar, por consola, que las bibliotecas se crearon
    #|(format t" ~%")
    (setq pos 0)
    (loop 
        (print (aref vecBibliotecas pos))
		(setq pos (+ pos 1)) 		            			
		(when (>= pos BIBLIOTECAS_SIZE) (return))	          
	)|#
)
#|Función secundaria para la creación de las Bibliotecas, 
    se valida que el vector no esté lleno. Sí está lleno: Informar, sino: Agregar bib al vector|#
(defun agregarBiblioteca(bib)
    (setq pos 0)	
    (loop 
        ;Verificar sí ya hay un 0 para registrar la Biblioteca
        (cond ((eq 0 (aref vecBibliotecas pos))
            ;Agregar nueva Biblioteca al vector
            (setf (aref vecBibliotecas pos) bib) (return 0))
        )
		(setq pos (+ pos 1)) 		            			
		(when (>= pos BIBLIOTECAS_SIZE) (return))	          
	) 
)
#|Función secundaria para la creación de las Bibliotecas, 
    se solicita la información necesaria para una Biblioteca|#
(defun llenarDatosBiblioteca(bib)
    ;Validar que el nit sea numero entero usando: integerp
    (print "Digite el NIT de la Biblioteca: ")
    (setf (Biblioteca-nit bib) (validarEntero))
    (print "Digite el nombre de la Biblioteca: ")
    (setf (Biblioteca-nombre bib)(read))
    (print "Digite la direccion de la Biblioteca: ")
    (setf (Biblioteca-direccion bib)(read))
    ;Vector para almacenar los 3 Libros
 	(setq vecLibros(make-array LIBROS_SIZE))
    ;Llenar de ceros el array de Libros
    (setq pos 0)
    (loop 
        (setf (aref vecLibros pos) 0)
        (setq pos (+ pos 1))
        (when (>= pos LIBROS_SIZE) (return))
    )
    ;Pasando el vector de libros
    (setf (Biblioteca-libros bib) vecLibros)
    (print "Biblioteca registrada con exito!")
)
#|Función para validar que los datos de entrada sean números enteros|#
(defun validarEntero()
    (loop
        (setq input (read))
        (if (integerp input)
          (return input)
          (format t "Error: Ingrese un numero entero valido: "))
    )
)