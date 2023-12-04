#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

#|Función principal para mostrar la información de un Libro específico en una Biblioteca específica|#
(defun mostrarLibro()
    (print "Digite el NIT de la Biblioteca: ")
    (setq nit (read))
    ;Se busca la Biblioteca por su NIT
    (setf infoBib (buscarBiblioteca nit))
    ;Sí no se encontró la Biblioteca
    (cond ((eq infoBib 0)
        (print "El NIT no pertenece a ninguna Biblioteca registrada.")
        (return-from mostrarLibro NIl)
    ))
    ;Sí se encontró la Biblioteca
    (print "Digite el codigo del Libro: ")
    (setq cod (read))
    ;cod = codigo del libro, refLibro = vecLibros de la biblioteca
    (setf libr (buscarLibro cod (Biblioteca-libros infoBib)))
    (cond ((eq libr 0)
        (print "El codigo no pertenece a ningun Libro registrado.")
        (return-from mostrarLibro NIl)
    ))
    (format t "Informacion del Libro:~%")
    (imprimirLibro libr)
)
#|Función encargada de buscar un Libro especifico en el vector de libros de una Biblioteca|#
(defun buscarLibro(cod refLibros)
    (setq pos 0)	
    (loop 
        (setq libr (aref refLibros pos))
        ;Sí no hay nada guardado en el vector
        (if (eq libr 0)
            (return-from buscarLibro 0)
        )
        ;Sí hay un Libro con el codigo == cod
        (cond ((eq cod (Libro-codigo libr))
            (return-from buscarLibro libr)
        ))
		(setq pos (+ pos 1)) 		            			
		(when (> pos BIBLIOTECAS_SIZE) (return) )	            
	)
    (return-from buscarLibro 0)
)
;Muestra un solo Libro
(defun imprimirLibro(vecLibros)
	(format t " Codigo: ~D - Titulo: ~S - Categoria: ~S~%" (Libro-codigo vecLibros) (Libro-titulo vecLibros) (Libro-categoria vecLibros))
)
;Muestra los libros que tiene una Biblioteca
(defun imprimirVectorLibros(refLibros)
    (setq index 0)	
    (loop 
		(setq libs (aref refLibros index) )
		(if (eq 0 libs)
			(format t "~%")
			(imprimirLibro libs)
		)
		(setq index (+ index 1)) 		            			
		(when ( > index BIBLIOTECAS_SIZE) (return) )	            
	)
) 