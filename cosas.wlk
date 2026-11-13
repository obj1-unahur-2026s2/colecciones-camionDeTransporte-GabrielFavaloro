object knightRider{
method peso() = 500
method peligrosidad() = 10
method consecuenciaDeCarga(){

    }
    method bultos() = 1
}

object bumblebee{
    var esRobot = false

method peso()= 800
method peligrosidad(){
    if (esRobot) {
        return 30
    } else {
        return 15
    }
}
method consecuenciaDeCarga(){
    esRobot = true
    }
method bultos() = 2
}
object paqueteDeLadrillos{
    var cantidadDeLadrillos = 0
    
    method peso() = cantidadDeLadrillos * 2
    method peligrosidad() = 2
    method cantidad(nueva) {
        cantidadDeLadrillos = nueva
    }
    method consecuenciaDeCarga() {
        cantidadDeLadrillos = cantidadDeLadrillos + 12
    }
    method bultos(){
        if (cantidadDeLadrillos <=100) {
            return 1
        }
        if (cantidadDeLadrillos <= 300) {
            return 2
        }
        return 3
    }
}
object arenaAGranel{
    var cantidadDeKilos = 0

    method nuevosKilos(nuevaCantidad) {
        cantidadDeKilos = nuevaCantidad
    }    
    method peso() = cantidadDeKilos
    method peligrosidad() = 1
    method consecuenciaDeCarga(){
        cantidadDeKilos = cantidadDeKilos - 10
    }
    method bultos() = 1
}
object bateriaAntiAerea{
    var conMisiles = true

    method peso(){
        if (conMisiles) {
            return 300
        } else {
            return 200
        }
    }
    method peligrosidad(){
        if(conMisiles) {
            return 100
        } else {
            return 0
        }
    }
    method consecuenciaDeCarga(){
        conMisiles = true
    }
    method bultos() {
        if (conMisiles) {
            return 2
        } else {
            return 1
        }
    }
}
object contenedorPortuario {
    const cosas = []
    method agregar(unaCosa) {
        cosas.add(unaCosa)
    }
    method peso() = 100 + cosas.sum({ cosa => cosa.peso() })
    
    method peligrosidad() {
        if (cosas.isEmpty()) {
            return 0
        } else {
            return cosas.max({ cosa => cosa.peligrosidad() }).peligrosidad()
        }
    }
    method consecuenciaDeCarga(){
        cosas.forEach({ cosa => cosa.consecuenciaDeCarga() })
    }
    method bultos() = cosas.sum({ cosa => cosa.bultos() })

}
object residuosRadioactivos{
    var cantidadDeKilos = 0

    method nuevosKilos(nuevaCantidad) {
        cantidadDeKilos = nuevaCantidad
    }
    method peso() = cantidadDeKilos
    method peligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeCarga(){
        cantidadDeKilos = cantidadDeKilos + 15
    }
}
object embalajeDeSeguridad{
    var contenido  = null

    method contenidoNuevo(unaCosa) {
        contenido = unaCosa
    }
    method peso() = contenido.peso()
    method peligrosidad() = contenido.peligrosidad() / 2
    method consecuenciaDeCarga(){
    
    }
    method bultos() = 2
}
