//
//  habitosViewController.swift
//  heartTech
//
//  Created by Alumno on 05/10/22.
//

import UIKit

class habitosViewController: UIViewController {
    
    
    @IBOutlet weak var sEjercicio: UISlider!
    @IBOutlet weak var sAlimentacion: UISlider!
    @IBOutlet weak var sEstadoGeneral: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
  
    @IBAction func guardar(_ sender: Any) {
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.habitos(ejercicio: Int(sEjercicio.value), alimentacion: Int(sAlimentacion.value), estadoGeneral: Int(sEjercicio.value))
        dismiss(animated: true)
    }
    /*
    @IBAction func guardarPresion(_ sender: UIButton) {
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.habitos(ejercicio: Int(sEjercicio.value), alimentacion: Int(sAlimentacion.value), estadoGeneral: Int(sEstadoGeneral.value))
        dismiss(animated: true)
    }
     */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
