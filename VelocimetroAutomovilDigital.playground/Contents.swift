//: Playground - VelocimetroAutomovilDigital: Este playground contiene el código de la práctica de la semana 4 del curso de inicialización a programación IOS organizado a través de Coursera por la Universidad de Monterrey.

import UIKit

enum Velocidades : Int {
    case apagado = 0, velocidadBaja = 20, velocidadMedia = 50, velocidadAlta = 150
    
    init(velocidadInicial : Velocidades) {
        self = velocidadInicial
    }
}

class Auto {
    var velocidad : Velocidades
    
    let diccionarioVelocidadAString : [Velocidades : String] = [Velocidades.apagado : "Apagado", Velocidades.velocidadBaja : "Velocidad baja", Velocidades.velocidadMedia : "Velocidad media", Velocidades.velocidadAlta : "Velocidad alta"]
    
    init() {
        self.velocidad = Velocidades(velocidadInicial: Velocidades.apagado)
    }
    
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena : String) {
        switch self.velocidad {
        case .apagado:
            self.velocidad = .velocidadBaja
        case .velocidadBaja:
            self.velocidad = .velocidadMedia
        case .velocidadMedia:
            self.velocidad = .velocidadAlta
        case .velocidadAlta:
            self.velocidad = .velocidadMedia
        default:
            break
        }
        return (self.velocidad.rawValue, self.diccionarioVelocidadAString[self.velocidad]!)
    }
}

print("Comienza la prueba del velocímetro de automovil digital\n")

var auto = Auto()

print("Estado inicial:  \(auto.velocidad.rawValue), \(auto.diccionarioVelocidadAString[auto.velocidad]!)")

for indice in 1...20 {
    let velocidadNueva = auto.cambioDeVelocidad()
    print("Iteración \(indice):  \(velocidadNueva.actual), \(velocidadNueva.velocidadEnCadena)")
}


