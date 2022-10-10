//
//  ViewControllerRegistro.swift
//  heartTech
//
//  Created by Nora Villarreal on 06/10/22.
//

import UIKit

class ViewControllerRegistro: UIViewController {

    @IBOutlet weak var tfRegCorreo: UITextField!
    
    @IBOutlet weak var tfRegPassword: UITextField!
    @IBOutlet weak var tfRegConfPassword: UITextField!
    @IBOutlet weak var tfRegNombre: UITextField!
    @IBOutlet weak var tfRegDia: UITextField!
    @IBOutlet weak var tfRegMes: UITextField!
    @IBOutlet weak var tfRegYear: UITextField!
    @IBOutlet weak var tfRegPeso: UITextField!
    @IBOutlet weak var tfRegAltura: UITextField!
    @IBOutlet weak var tfRegAncho: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registrarse(_ sender: Any) {
        let alerta = UIAlertController(title: "Privacidad", message: "Al registrarse, acepta los términos y codiciones de esta aplicación.", preferredStyle: .alert)
        let accion = UIAlertAction(title: "OK", style: .cancel)
        alerta.addAction(accion)
        present(alerta, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

