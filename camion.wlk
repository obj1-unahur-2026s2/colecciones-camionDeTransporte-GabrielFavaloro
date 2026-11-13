object camion {
  const cosas = []
  
  // 1. Cargar y descargar
  method cargar(unaCosa) {
    cosas.add(unaCosa)
    unaCosa.consecuenciaDeCarga()
  }
  
  method descargar(unaCosa) {
    cosas.remove(unaCosa)
  }
  
  // 2. Peso total (Tara + la suma del peso de todo lo cargado)
  method pesoTotal() {
    return 1000 + cosas.sum({ cosa => cosa.peso() })
  }
  
  // 3. Consultas sobre los pesos
  method sonPesosPares() {
    return cosas.all({ cosa => cosa.peso().even() })
  }
  
  method hayAlgunoQuePese(unPeso) {
    return cosas.any({ cosa => cosa.peso() == unPeso })
  }
  
  // 4. Consultas por peligrosidad
  method primeraCosaConPeligrosidad(unNivel) {
    return cosas.find({ cosa => cosa.peligrosidad() == unNivel })
  }
  
  method cosasMasPeligrosasQueNivel(unNivel) {
    return cosas.filter({ cosa => cosa.peligrosidad() > unNivel })
  }
  
  method cosasMasPeligrosasQueUnaCosa(unaCosa) {
    return self.cosasMasPeligrosasQueNivel(unaCosa.peligrosidad())
  }
  
  // 5. Controles de circulación y peso máximo (2500 kg)
  method estaExcedidoDePeso() {
    return self.pesoTotal() > 2500
  }
  
  method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
    return not self.estaExcedidoDePeso() and 
           cosas.all({ cosa => cosa.peligrosidad() <= nivelMaximoPeligrosidad })
  }
  
  // Agregados
  method tieneAlgoEntre(minimo, maximo) {
    return cosas.any({ cosa => cosa.peso().between(minimo, maximo) })
  }
  
  method cosaMasPesada() {
    return cosas.max({ cosa => cosa.peso() })
  }
    method totalBultos(){
        return cosas.sum({ cosa => cosa.bultos() })
    }
}