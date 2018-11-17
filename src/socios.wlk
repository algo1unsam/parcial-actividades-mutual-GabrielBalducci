
object mutual {
	var actividades = []
	method agregarAct(act){actividades.add(act)} 
	method actividades() = actividades
}
class Socio {
	var property actividadesRealizadas = []
	var property maxActividades
	var property edad
	var property idiomas = []
	var property tipo
		
	method adoraElSol() = actividadesRealizadas.all{act => act.bronceado()} 
	
	method conEsfuerzo() = actividadesRealizadas.filter{act => act.esfuerzo()}
	
	method hizo(act) = actividadesRealizadas.contains(act)
		
	method registrarAct(actividadNueva){
		if (actividadesRealizadas.size() < maxActividades){
			actividadesRealizadas.add(actividadNueva)
		}
		else{
			throw new Exception("no se pueden agregar mas actividades")
		}
	}
	method leAtrae() = tipo.buscoAct(self)
}
object tranquilo{
	method buscoAct(socio) = mutual.actividades().filter{act => act.dias()>3}
}
object coherente { //si socio no es amante del sol, DEVUELVE NULL!!!
	method buscoAct(socio){
		if (socio.adoraElSol()){
			return mutual.actividades().filter{act => act.bronceado() or act.esfuerzo()}
		}
		else return null //cuidado!!!
	}
}
object relajado{
	method buscoAct(socio) {return 
		socio.idiomas().flatMap{idioma =>
			mutual.actividades().filter{act=>
				act.idiomas().contain(idioma)
			}
		}
	}
}
