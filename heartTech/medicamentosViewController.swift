//
//  medicamentosViewController.swift
//  heartTech
//
//  Created by Alumno on 05/10/22.
//

import UIKit

class medicamentosViewController: UIViewController {
    
    var numero = 0
    
    @IBOutlet weak var lbNumero: UILabel!
    @IBOutlet weak var btUp: UIButton!
    @IBOutlet weak var btDown: UIButton!
    
    
    

    override func viewDidLoad() {
        lbNumero.text = String(numero)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        if (numero > 0) {
            let alerta = UIAlertController(title: "Advertencia", message: "¿Salir sin guardar la información?", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Sí", style: .cancel) {action in
                self.dismiss(animated: true)
            }
            alerta.addAction(accion)
            let accionCancelar = UIAlertAction(title: "No", style: .default)
            alerta.addAction(accionCancelar)
            present(alerta, animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @IBAction func subir(_ sender: Any) {
        if (numero < 10) {
            numero = numero + 1
            lbNumero.text = String(numero)
        }
    }
    
    @IBAction func bajar(_ sender: Any) {
        if (numero > 0) {
            numero = numero - 1
            lbNumero.text = String(numero)
        }
    }
    
    @IBAction func guardar(_ sender: Any) {
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.medicamentos(faltantes: numero)
        dismiss(animated: true)
    }
    
    
    
    
    /*
    @IBAction func guardarPresion(_ sender: UIButton) {
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.medicamentos(faltantes: Int(1))
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
