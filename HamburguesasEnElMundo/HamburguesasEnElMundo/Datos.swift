//
//  Datos.swift
//  HamburguesasEnElMundo
//
//  Este archivo fuente contendrá las clases de datos usadas en la aplicación
//
//  Created by Adrián Rejas on 19/6/16.
//
//

import Foundation
import UIKit

// Colección de paises que se usarán en la aplicación. Se ha testeado en un playground que hay 20.
class ColeccionDePaises {
    // Array de strings con los paises a usar; si se quiere incluir alguno añadirlo a este array.
    let paises : [String] = ["España", "Inglaterra", "Francia", "Alemania", "Italia", "Polonia", "Holanda", "Bélgica", "Rusia", "Estados Unidos", "Canada", "Mexico", "Japón", "China", "Australia", "Brasil", "Argentina", "Colombia", "Marruecos", "Turquía"]
    
    /* OPINION PERSONAL: Esta función si de mi dependiese la declararía como función estática y la llamaría a través del nombre de la clase en vez del nombre de la instancia que se use. De esta manera no sería necesario crear una instancia de ColeccionDePaises para llamar a obtenPais(). Es más, usaría un enum con métodos estáticos declarados, creo que tiene más sentido. Pero como en el enunciado se dice claramente que tiene que ser así, así se hará. */
    // Función para obtener el string que representa un país de forma aleatoria
    func obtenPais() -> String {
        /* Aunque el profesor usa la primera opción de las dos lineas siguentes, he usado la segunda porque arc4random() devuelve un objeto tipo UInt32 y se intenta transformar a Int. En dispositivos de 64 bits, como el iPhone 6, no da problemas ya que Int es de 64 bits pero en dispositivos de 32 bits, como el iPhone 4S, al ser Int de 32 bytes la conversión de uint32 a Int puede dar lugar a un error de ejecución por variable fuera de rango. */
        //let posicion = Int(arc4random())%paises.count
        let posicion : Int = Int(arc4random()%UInt32(paises.count))
        return paises[posicion]
    }
    
}

// Colección de hamburguesas que se usarán en la aplicación. Se ha testeado en un playground que hay 20.
class ColeccionDeHamburguesas {
    // Array de strings con las hamburguesas a usar; si se quiere incluir alguna añadirla a este array.
    let hamburguesas : [String] = ["Hamburguesa sencilla", "Hamburguesa con queso", "Hamburguesa con bacon y queso", "Hamburguesa con bacon, queso y huevo", "Hamburguesa Doble", "Hamburguesa doble con queso", "Hamburguesa doble con bacon y queso", "Hamburguesa doble con bacon, queso y huevo", "Hamburguesa con vegetales", "Hamburguesa con vegetales y queso", "Hamburguesa con vegetales, bacon y queso", "Hamburguesa con vegetales, bacon, queso y huevo", "Hamburguesa especial con jalapeños", "Hamburguesa especial 4 quesos", "Hamburguesa especial con setas", "Hamburguesa especial con ternasco", "Hamburguesa de pollo", "Hamburguesa de pollo con queso", "Hamburguesa de pollo con bacon y queso", "Hamburguesa vegana"]
    
    // OPCIONAL A LA TAREA: estas variables definen las constantes a usar para calcular el precio de la hamburguesa.
    let precioMinimo : Float = 3.0
    let precioVariacion : Float = 0.10
    
    /* OPINION PERSONAL: Lo comentado en obtenPais() se aplica también en esta función */
    // Función para obtener el string que representa una hamburguesa de forma aleatoria
    func obtenHamburguesa() -> String {
        /* Aquí pasa el mismo problema de obtenPais() relacionado con errores de ejecución fuera de rango */
        //let posicion = Int(arc4random())%hamburguesas.count
        let posicion : Int = Int(arc4random()%UInt32(hamburguesas.count))
        return hamburguesas[posicion]
    }
    
    // OPCIONAL A LA TAREA: Aunque en las instrucciones no se habla de ello, como en la descripción de la tarea se habla de un precio he decidido añadir el precio de forma extra a la aplicación. Lo normal sería hacer un array bidimensional en el que se especificase el precio de cada hamburguesa en cada país. Pero como se trata de un añadido extra para la tarea y no es necesario complicar el programa en exceso más alla de la tarea, he decidico que el precio de cada hamburguesa en cada país será igua a (precioMinimo + (longitudStringHamburguesa+longitudStringPais)*precioVariacion
    func obtenPrecioHamburguesaPorPais(hamburguesa : String, pais : String) -> Float{
        return (precioMinimo + (Float(hamburguesa.characters.count + pais.characters.count)*precioVariacion))
    }
    
}

// Estructura representando los colores que puede tomar el fondo de la aplicación. Es la estructura usada por el profesor en los video del curso.
struct Colores {
    // Listado de colores
    let colores = [ UIColor(red:210/255.0, green: 90/255.0, blue: 45/255.0, alpha: 0.5),
        
        UIColor(red:40/255.0, green: 170/255.0, blue: 45/255.0, alpha: 0.5),
        
        UIColor(red:3/255.0, green: 180/255.0, blue: 90/255.0, alpha: 0.5),
        
        UIColor(red:210/255.0, green: 190/255.0, blue: 5/255.0, alpha: 0.5),
        
        UIColor(red:120/255.0, green: 120/255.0, blue: 50/255.0, alpha: 0.5),
        
        UIColor(red:130/255.0, green: 80/255.0, blue: 90/255.0, alpha: 0.5),
        
        UIColor(red:130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 0.5),
        
        UIColor(red:3/255.0, green: 50/255.0, blue: 90/255.0, alpha: 0.5)]
    
    // Función para obtener un color aleatorio
    func regresaColorAleatorio() -> UIColor{
        let posicion : Int = Int(arc4random()%UInt32(colores.count))
        return colores[posicion]
    }
    
}
