import viajes.*
class ViajePlaya inherits Viaje{
	var property largoPlaya
	override method dias() = largoPlaya/500
	override method esfuerzo() = largoPlaya >1200
	override method bronceado() = true
}
class ViajeCiudad inherits Viaje{
	var property atracciones
	override method dias() = atracciones/2
	override method esfuerzo() = atracciones >5
	override method bronceado() = false
	override method esInteresante() = (super()) or (atracciones==5)	
}
class ViajeCiudadTrop inherits ViajeCiudad{
	override method dias() = super() + 1
	override method bronceado() = true
}
class ViajeTrekking inherits Viaje{
	var property kilometros
	var property diasSol
	override method dias() = kilometros/50
	override method esfuerzo() = kilometros>80
	override method bronceado() = (diasSol>200) or (diasSol>99 and kilometros>120)
	override method esInteresante() = (super()) and (diasSol>140)
}