//
//  ViewController.swift
//  HamburguesasEnElMundo
//
//  En el ViewController implementaremos la lógica de control de la interfaz gráfica para que cuando se pulse el botón (centrado horizontalmente y ajustado abajo) que está en la parte baja de la pantalla se actualizen tres etiquetas (centradas horizontal y verticalmente) con la información de hamburguesa, país y precio (las dos primeras solicitadas por el enunciado de la aplicación, la segunda es opcional) se actualicen con valores aleatorios.
//
//  Created by Adrián Rejas on 19/6/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    // Instancias de las colecciones de paises, hamburguesas y colores de los datos de swift. Datos provenientes de Datos.swift
    let paises = ColeccionDePaises()
    let hamburguesas = ColeccionDeHamburguesas()
    let colores = Colores()

    // IBOutlets relacionados con las UILabels usadas para mostrar la información de país, hamburguesa y precio.
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var hamburguesaLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mostrarNuevaHamburguesa() {
        // Primero realizamos una comprobación de que las etiquetas están instanciadas, para evitar errores de ejecución
        if paisLabel == nil || hamburguesaLabel == nil || precioLabel == nil {
            return
        }
        // Ahora se obtiene el país y la hamburguesa a mostrar aleatoriamente, y el precio correspondiente a dicha pareja
        let pais : String = paises.obtenPais()
        let hamburguesa : String = hamburguesas.obtenHamburguesa()
        let precio : Float = hamburguesas.obtenPrecioHamburguesaPorPais(hamburguesa, pais: pais)
        // Actualizamos las etiquetas con la información recién obtenida
        paisLabel.text = "Pais: \(pais)"
        hamburguesaLabel.text = "Hamburguesa: \(hamburguesa)"
        precioLabel.text = "Precio: \(precio) $"
        //OPCIONAL A LA TAREA: Cambiamos el color del fondo y del tilt aleatoriamente
        let color = colores.regresaColorAleatorio()
        view.backgroundColor = color
        view.tintColor = color
        // OPCIONAL A LA TAREA: Por defecto he puesto el alpha de las etiquetas a 0.3, para recalcar que al principio no hay información valida. En cuanto se pulsa el botón, se ponte el alpha de estas estiquetas  a 1.
        paisLabel.alpha=1
        hamburguesaLabel.alpha=1
        precioLabel.alpha=1
    }

}

