#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

#|Función principal para imprimir la información asociada a una Biblioteca encontrada por su nit|#
(defun mostrarBiblioteca()
    (print "Digite el NIT de la Biblioteca: ")
    (setq nit (read))
    ;Se busca la Biblioteca por su NIT
    (setf infoBib (buscarBiblioteca nit))
    ;Sí no se encontró la Biblioteca
    (cond ((eq infoBib 0)
        (print "El NIT no pertenece a ninguna Biblioteca registrada.")
        (return-from mostrarBiblioteca NIl)
    ))
    ;Imprimir info Biblioteca
    (format t "~%- - - - DATOS BIBLIOTECA - - - -~%")
    (imprimirBiblioteca infoBib)
    ;Imprimir Libros de la Biblioteca
    (format t " LIBROS DE LA BIBLIOTECA~%")
    (imprimirVectorLibros (Biblioteca-libros infoBib))
)
#|Función secundaria para imprimir info, se encarga de buscar la Biblioteca, 
    por medio del nit recibido por el Usuario|#
(defun buscarBiblioteca(nit)
    (setq pos 0)
    (loop 
        (setq bibl (aref vecBibliotecas pos))
        ;Sí no hay nada guardado en el vector
        (if (eq bibl 0)
            (return-from buscarBiblioteca 0)
        )
        ;Sí hay una Biblioteca con el nit
        (cond ((eq nit (Biblioteca-nit bibl)) 
            (return-from buscarBiblioteca bibl)  
        ))
		(setq pos (+ pos 1)) 		            			
		(when (>= pos BIBLIOTECAS_SIZE) (return))	          
	)
    (return-from buscarBiblioteca 0)
)
;Muestra las Bibliotecas registradas
(defun imprimirBibliotecas()
    (setq pos 0)	
    (loop 
		(cond ((not (eq 0 (aref vecBibliotecas pos)))
				(format t " ~D) NIT: ~D - Nombre: ~S - Direccion: ~S~%" (+ pos 1) (Biblioteca-nit (aref vecBibliotecas pos)) (Biblioteca-nombre (aref vecBibliotecas pos)) (Biblioteca-direccion (aref vecBibliotecas pos)))
			  )
		)
		(setq pos (+ pos 1)) 		            			
		(when (>= pos BIBLIOTECAS_SIZE) (return) )	           
	)
)
;Muestra la información de una Biblioteca
(defun imprimirBiblioteca(prmBib)
	(format t "NIT: ~D - Nombre: ~S - Direccion: ~S~%" (Biblioteca-nit prmBib) (Biblioteca-nombre prmBib) (Biblioteca-direccion prmBib))
)