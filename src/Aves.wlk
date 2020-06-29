import Islas.*
import Nidos.*

class Ave {
	method fuerza()	
	method recibirDisgusto()
	/*Método adicional*/
	method esCapitana() {
		return self.fuerza().between(1000, 3000)
	}
	method estaConformeCon(unaIsla)
	method relajarse()
	method tomarAlimentoDe(unaIsla)
		
}

class Aguilucho inherits Ave {
	var property velocidad = 20
	
	override method fuerza() {
		if (velocidad <= 60) {
			return 180
		}
		else {
			return velocidad * 3
		}
	}
	override method recibirDisgusto() {
		velocidad = velocidad * 2
	}
	override method estaConformeCon(unaIsla) {
		return unaIsla.alpiste() >= 8 
	}
	override method relajarse() {
		velocidad = velocidad - 10
	}
	override method tomarAlimentoDe(unaIsla) {
		velocidad = velocidad + 15
		unaIsla.quitarAlpiste(3)
	}
}

class Albatros inherits Ave {
	var property peso = 4000
	var property masaMuscular = 600
	
	override method fuerza() {
		if (peso < 6000) {
			return masaMuscular
		}
		else {
			return masaMuscular / 2
		}
	}
	override method recibirDisgusto() {
		peso = peso + 800
	}
	method irAlGimnasio() {
		peso = peso + 500
		masaMuscular = masaMuscular + 500
	}
	override method estaConformeCon(unaIsla) {
		return unaIsla.avesMasFuertesQue(self).size() <= 2 //COMPLICADO
	}
	override method relajarse() {
		peso = peso - 300
	}
	override method tomarAlimentoDe(unaIsla) {
		peso = peso + 700
		masaMuscular = masaMuscular + 700
		unaIsla.quitarMaiz(4)
	}
}

class Paloma inherits Ave {
	var property ira = 200
	
	override method fuerza() {
		return ira * 2
	}	
	override method recibirDisgusto() {
		ira = ira + 300
	}
	override method estaConformeCon(unaIsla) {
		return unaIsla.avesDebiles().size() <= 1
	}
	override method relajarse() {
		ira = ira - 50
	}
	override method tomarAlimentoDe(unaIsla) {
		
	}
	method equilibrarse() {
		if (self.fuerza() <= 700) {
			self.recibirDisgusto()
		}
		else {
			self.relajarse()
		}
	}
}

class AguiluchoColorado inherits Aguilucho {
	override method fuerza() {
		return super() + 400
	}
}

class PalomaTorcaza inherits Paloma {
	var property huevos = 3
	
	override method fuerza() {
		return super() + huevos * 100
	}
	override method recibirDisgusto() {
		super()
		huevos = huevos + 1
	}
}

class PalomaMontera inherits Paloma {
	override method fuerza() {
		return topeDeFuerza.tope().min(super()) //"tope" PODRIA HABER SIDO UN ATRIBUTO
	}	
}

class PalomaManchada inherits Paloma {
	const property nidos = []
		
	method agregarNido(unNido) {
		nidos.add(unNido)
	}
	method quitarNido(unNido) {
		nidos.remove(unNido)
	}
	method agregarNidos(variosNidos) {
		nidos.addAll(variosNidos)
	}
	/*Método adicional*/
	method cantidadDeNidos() {
		return nidos.size()
	}
	override method recibirDisgusto() { //COMPLICADO
		super()
		const nido = new Nido()
		self.agregarNido(nido)	
		/*Podría haberse puesto también "self.agregarNido(new Nido())" */	
	}
	override method relajarse() {
		if (self.cantidadDeNidos() > 2) {
			nidos.forEach({ nido => nido.aumentarGrosor(1) }) //COMPLICADO			
		}
		else {
			super()
		}
	}
	method potenciaDeLosNidos() {
		return nidos.sum({ nido => nido.potencia() })
	}
	method agregarPotenciaALaIra() {
		ira = ira + self.potenciaDeLosNidos()
		/*Se podría haber hecho un "override method ira()" y 
		 "return ira + self.potenciaDeLosNidos()" tendría más sentido*/
	}
}

object topeDeFuerza {
	var property tope = 2000 
}















