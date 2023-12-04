#|***************************************************************
Desarrollado por: Sergio David Ariza <sariza@unicauca.edu.co>
                  Carlos Enrique Hernandez <>
***************************************************************|#

(load "0_Crear.lsp")
(load "1_RegistrarBiblioteca.lsp")
(load "2_RegistrarLibro.lsp")
(load "3_BuscarBiblioteca.lsp")
(load "4_BuscarLibro.lsp")
(load "5_LibrosAventura.lsp")

(loop
	(print " ===========================================")
	(print " |                M E N U                  |")
	(print " ===========================================")
	(format t" ~%") 
	(print "   1.   Registrar Biblioteca ")
	(print "   2.   Registrar Libro ")
	(print "   3.   Buscar Biblioteca ")
	(print "   4.   Buscar un Libro en una Biblioteca.")
	(print "   5.   Consultar Libros de AVENTURA en una Biblioteca.")
	(print "   6.   Salir.")
	(format t" ~%")
	(print "   Digite la opcion:")
    (setq Opcion(read))	
  	(case Opcion
		(1 (registrarBiblioteca))
		(2 (registrarLibros))
		(3 (mostrarBiblioteca))
		(4 (mostrarLibro))
		(5 (consultarLibrosAventura))
	    (otherwise nil)
	)
	(when (eq Opcion 6) (print "Programa Finalizado") (return))
)