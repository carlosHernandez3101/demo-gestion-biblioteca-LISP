#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

#|Función principal para consultar y mostrar el total de Libros de Aventura en una Biblioteca|#
(defun consultarLibrosAventura()
    (print "Digite el NIT de la Biblioteca: ")
    (setq nit (read))
    ;Se busca la Biblioteca por su NIT
    (setf infoBib (buscarBiblioteca nit))
    ;Sí no se encontró la Biblioteca
    (cond ((eq infoBib 0)
        (print "El NIT no pertenece a ninguna Biblioteca registrada.")
        (return-from consultarLibrosAventura NIl)
    ))
    ;Llamado a la función para contar los Libros, pasando como argumento el vector de Libros de la Biblioteca
    (setf libs (contarLibrosAventura (Biblioteca-libros infoBib)))
    ;Sí hay o no Libros de aventura en la Biblioteca
    (if (equal 0 libs)
        (print "No se encontraron Libros con la categoria AVENTURA.")
        (format t "Numero total de Libros de AVENTURA en la Bilioteca: ~D ~%" libs)
    )
)
#|Función que retorna la cantidad de Libros de AVENTURA que hay en una Biblioteca|#
(defun contarLibrosAventura(refLibros)
    ;Variable contador
    (setq cont 0)
    ;Recorriendo el vector y comparando la categoría del Libro con "AVENTURA"
    (setq pos 0)
    (loop 
        (setq varlibro (aref refLibros pos))
        ;Sí no hay Libros, o más Libros de esa categoría, retorna
        (if (eq varlibro 0)
            (return-from contarLibrosAventura cont)
        )
        ;Comparando la categoría para aumentar o no, el contador
        (cond ((eq (car '(AVENTURA)) (Libro-categoria varlibro))
                (setq cont (+ cont 1)))
        )
        (setq pos (+ pos 1))
        (when (> pos BIBLIOTECAS_SIZE) (return))
    )
    ;Retornar el valor del contador
    (return-from contarLibrosAventura cont)
)