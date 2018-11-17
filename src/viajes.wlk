class Viaje {
	var property idiomas = []
	
	method dias() = null
	method esfuerzo() = false
	method bronceado() = false

	method esInteresante() = idiomas.size() > 1
	
	method seRecomiendaA(socio) {return
		self.esInteresante() and
		socio.leAtrae().contains(self) and
		not socio.hizo(self)
	}
}
class ClaseGimnasia inherits Viaje{
	override method idiomas() = ["espaniol"]
	override method dias() = 1
	override method esfuerzo() = true
	override method seRecomiendaA(socio)= socio.edad()<30 and socio.edad()>20
}
class Libro {
	var property idioma= ""
	var property cantPag =0
	var property autor = ""
}
class TallerLiterario inherits Viaje{
	var property libros = []
	override method idiomas() = libros.flatmap{libro=> libro.idioma()}
	override method dias()= libros.size() + 1
	override method esfuerzo() =
		(libros.any{libro=> libro.cantPag()>500}) or
		(libros.size()>1 and libros.all{libro=> 
			libro.autor() == libros.first().autor()})
			
	override method seRecomiendaA(socio)= socio.idiomas().size()>2
}