class Isla {
	const property aves = []
	var property alpiste = 10
	var property maiz = 10
	
	method agregarAlpiste(cuanto) {
		alpiste = alpiste + cuanto
	}
	method quitarAlpiste(cuanto) {
		alpiste = alpiste - cuanto
	}
	method agregarMaiz(cuanto) {
		maiz = maiz + cuanto
	}
	method quitarMaiz(cuanto) {
		maiz = maiz - cuanto 
	}
	method agregarAve(unAve) {
		aves.add(unAve)
	}
	method agregarAves(variasAves) {
		aves.addAll(variasAves)
	}
	method quitarAve(unAve) {
		aves.remove(unAve)
	}
	method avesDebiles() {
		return aves.filter({ ave => ave.fuerza() < 1000 })
	}
	method fuerzaTotal() {
		return aves.sum({ ave => ave.fuerza() })
	}
	/*Método adicional*/ 
	method avesMasFuertesQue(unAve) {
		return aves.filter({ ave => ave.fuerza() > unAve })
	}
	method esRobusta(unaIsla) {
		return unaIsla.fuerzaTotal() > 300
	}
	method huboTerremoto() {
		aves.forEach({ ave => ave.recibirDisgusto() })
	}
	method huboTormenta() {
		self.avesDebiles().forEach({ ave => ave.recibirDisgusto() })
	}
	method aveCapitana() {
		return aves.filter({ ave => ave.esCapitana() })
	}
	method estaEnPaz() {
		return aves.all({ ave => ave.estaConformeCon(self) })
	}
	method relax() {
		aves.forEach({ ave => ave.relajarse() })
	}
	method alimentacion() {
		aves.forEach({ ave => ave.tomarAlimentoDe(self) })
	}
	
}
