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
    
    var regNombre : String!
    
    
    override func viewDidLoad() {
        tfRegNombre.text = regNombre
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func atras(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registrarse(_ sender: Any) {
        
        
        if tfRegNombre.text == "" || tfRegMes.text == "" || tfRegDia.text == "" || tfRegYear.text == "" || tfRegCorreo.text == "" || tfRegPassword.text == "" || tfRegConfPassword.text == "" {
            let alerta = UIAlertController(title: "Error", message: "No se pueden guardar los cambios porque hay campos vacíos.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        }
        
        else if let checarPass1 = tfRegPassword.text,
                let checarPass2 = tfRegConfPassword.text,
                checarPass1 != checarPass2 {
            let alerta = UIAlertController(title: "Error", message: "Las contraseñas ingresadas no coinciden.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        }
        
    
        let yearInt = Int(tfRegYear.text!) ?? 0
            if yearInt > 2022{
                let alerta = UIAlertController(title: "Error", message: "Fecha de nacimiento inválida.", preferredStyle: .alert)
                let accion = UIAlertAction(title: "OK", style: .cancel)
                alerta.addAction(accion)
                present(alerta, animated: true)
            }
        
        else {
            //let alerta = UIAlertController(title: "Usuario registrado", message: "La información se ha guardado con éxito.", preferredStyle: .alert)
            //let accion = UIAlertAction(title: "OK", style: .cancel)
            //alerta.addAction(accion)
            //present(alerta, animated: true)
            self.dismiss(animated: true, completion: nil)
            //let alerta = UIAlertController(title: "Privacidad", message: "Al registrarse, acepta los términos y codiciones de esta aplicación.", preferredStyle: .alert)
            //let accion = UIAlertAction(title: "OK", style: .cancel)
            //alerta.addAction(accion)
            //present(alerta, animated: true)
        }

    }
    
    
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func actualizaInt(mensajeRegresado : String){
        tfRegNombre.text = mensajeRegresado
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
