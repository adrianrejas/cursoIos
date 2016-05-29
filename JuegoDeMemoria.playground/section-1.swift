// Playground - noun: a place where people can play

import UIKit

// Primero un mensaje de introducción a la ejecución
print("Comienza el juego de la memoria:\n")

// Creamos el rango con ... en vez de ..< para incluir el número 100
// Realizamos el bucle con la sentencia "for ... in"
for numero in 0...100 {
    /* 
    Aquí se ha decidido que de acuerdo al enunciado de la tarea las reglas impuestas no son excluyentes, y por tanto puede imprimirse varias veces,una por cada vez que cumpla una de las cuatro reglas establecidas. Esto se ha decidido así porque en el enunciado de la tarea no se ha establecido un orden de prioridad de las reglas en caso de que un número cumpliera más de una, cosa que pasaría seguro con los múltiplos de 5, por ejemplo.
    */
    // Comprobamos si es divisible por 5 con el operador %
    if numero%5 == 0 {
        print("#\(numero) Bingo!!!")
    }
    // Comprobamos si es par comprobando si es divisible por 2.
    // Si no lo es lo consideramos impar (por eso el uso de if ... else).
    if numero%2 == 0 {
        print("#\(numero) Par!!!")
    } else {
        print("#\(numero) Impar!!!")
    }
    /*
    Dado que no se especifica en el enunciado de la tarea, se ha decidido que el rango entre 30 y 40 incluye los números 30 y 40 (siendo 11 objetos al final).
    */
    // Se ha comprobado el rango comprobando si es mayor o igual a 30 y menor o igual a 40
    if numero>=30 && numero<=40 {
        print("#\(numero) Viva Swift!!!")
    }
}







