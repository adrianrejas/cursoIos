//: Playground - VelocimetroAutomovilDigital: Este playground contiene el código de la práctica de la semana 4 del curso de inicialización a programación IOS organizado a través de Coursera por la Universidad de Monterrey.

import UIKit

/* Enumerado que representa las velocidades posibles de un velocímetro (4 velocidades posibles, de tipo Int) */
enum Velocidades : Int {
    case apagado = 0, velocidadBaja = 20, velocidadMedia = 50, velocidadAlta = 120
    
    // Inicializamos la velocidad con la que se proporcione al crear la instancia
    init(velocidadInicial : Velocidades) {
        self = velocidadInicial
    }
}

/* Clase que representa un automovil, por ahora contiene únicamente información de la velocidad a la que está circulando el automovil*/
class Auto {
    // Variable que representa la velocidad acutal a la que circula el automovil, usando el enumerado creado anteriormente
    var velocidad : Velocidades
    
    // Aunque no se exigía nada relativo a esto en el enunciado de la tarea, he creado una constante que define un diccionario para pasar de Velocidades a String, de cara a ayudar en la ejecución de la función cambioDeVelocidad(). Normalmente esto ser haría con una constante estática (usando la palabra reservada "static" delante de la definición de la constante y usando el nombre de la clase en vez del nombre de la instancia para acceder a esta constante). Lo he probado y funciona, pero he decidido dejarlo como constante no estática dado que a estas alturas del curso todavía no hemos tratado las propiedades estáticas de las clases.
    let diccionarioVelocidadAString : [Velocidades : String] = [Velocidades.apagado : "Apagado", Velocidades.velocidadBaja : "Velocidad baja", Velocidades.velocidadMedia : "Velocidad media", Velocidades.velocidadAlta : "Velocidad alta"]
    
    // Inicializador definiendo como velocidad inicial la de apagado, haciendo uso del inicializador de Velocidades.
    init() {
        self.velocidad = Velocidades(velocidadInicial: Velocidades.apagado)
    }
    
    /* Aquí se me ha planteado una duda que en mi opinión no queda bien resuelta en el enunciado de la tarea, dado que hay una contradicción en dicho enunciado. Según la parte del enunciado relativa a la función, esta función debería devolver la información referente a la velocidad nueva, ya actualizada (es decir, actualizamos la velocidad y retornamos la información de la velocidad DESPUES de actualizarla). Pero de acuerdo a la parte del enunciado relativa a las pruebas de la función (donde se especifica que en la iteración hay que llamar necesariamente primero a cambioDeVelocidad() y luego a print() y no al reves), y de acuerdo al ejemplo de salida válida con 5 iteraciones, esta función debería actualizar la velocidad, pero retornar la información de la velocidad ANTES de actuarlizarla (es decir, la ya antigua una vez actualizada). Si el ejemplo de salida válida fuera de acuerdo a la primera interpretación posible, sería así:
    
            20, Velocidad baja
    
            50, Velocidad media
    
            120, Velocidad alta
    
            50, Velocidad media
    
            120, Velocidad alta
    
            50, Velocidad media
    
            120, Velocidad alta
    
            50, Velocidad media
    
            ...
    
        Dado que la muestra de salida válida de la prueba de Auto es específica y el enunciado de la tarea para la función está más abierto a interpretación, he optado por la segunda opción (actualizar la velocidad pero devolver la información de la velocidad ANTES de actualizarla). Si se quiere observar como sería en caso de tomar la segunda opción, comentar el return y el let de la función y descomentar el segundo return, de esa manera la información de velocidad devuelta será la nueva, DESPUES de actualizada.
    
    */
    //Función que actualiza la velocidad del auto de acuerdo a las reglas impuestas en el enunciado y devuelve la velocidad actual
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena : String) {
        let velocidadADevolver = (self.velocidad.rawValue, self.diccionarioVelocidadAString[self.velocidad]!)
        switch self.velocidad {
        case .apagado:
            self.velocidad = .velocidadBaja
        case .velocidadBaja:
            self.velocidad = .velocidadMedia
        case .velocidadMedia:
            self.velocidad = .velocidadAlta
        case .velocidadAlta:
            self.velocidad = .velocidadMedia
        }
        return velocidadADevolver
        //return (self.velocidad.rawValue, self.diccionarioVelocidadAString[self.velocidad]!)
    }
}

// Comienza la parte de pruebas de la clase Auto del playground

print("Comienza la prueba del velocímetro de automovil digital:\n")

// Definimos la instancia de Auto usando el inicializador creado
var auto = Auto()

// Creamos un bucle de 20 iteraciones con un for ... in
for indice in 1...20 {
    // LLamamos a cambioDeVelocidad()
    let velocidadDevuelta = auto.cambioDeVelocidad()
    // Imprimimos la velocidad devuelta por la función
    print("Iteración \(indice):  \(velocidadDevuelta.actual), \(velocidadDevuelta.velocidadEnCadena)")
}


