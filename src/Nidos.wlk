class Nido {
	var property grosor = 5
	var property resistencia = 3
	
	method potencia() {
		return grosor * resistencia + 20
	}
	method aumentarGrosor(cuanto) {
		grosor = grosor + cuanto
	}
}
