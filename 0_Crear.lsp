#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

;Definición de estructuras
(defun crearEstructuras()
  ;Estructura necesaria para crear las Bibliotecas
  (defstruct Biblioteca
    nit
    nombre
    direccion
    libros
  )
  ;Tamaño del vector para las Bibliotecas necesarias
  (setq BIBLIOTECAS_SIZE 2)
  ;Vector para almacenar las 2 Bibliotecas
 	(setq vecBibliotecas(make-array BIBLIOTECAS_SIZE))
  ;Llenar de ceros el array
  (setq pos 0)
  (loop 
      (setf (aref vecBibliotecas pos) 0)
      (setq pos (+ pos 1))
      (when (>= pos BIBLIOTECAS_SIZE) (return))
  )	
  ;Estructura necesaria para crear los Libros
  (defstruct Libro
    codigo
    titulo
    categoria
  )
  ;Tamaño del vector para los Libros en una Biblioteca
  (setq LIBROS_SIZE 3)
  ;Lista de categorías válidas
  (setq categorias '("DRAMA" "SUSPENSO" "AVENTURA"))
)