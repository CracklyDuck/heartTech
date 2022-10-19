//
//  ViewControllerRegistro.swift
//  heartTech
//
//  Created by Nora Villarreal on 06/10/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewControllerRegistro: UIViewController {

    @IBOutlet weak var tfRegCorreo: UITextField!
    
    @IBOutlet weak var tfRegPassword: UITextField!
    @IBOutlet weak var tfRegConfPassword: UITextField!
    @IBOutlet weak var tfRegNombre: UITextField!
    @IBOutlet weak var tfRegDia: UITextField!
    @IBOutlet weak var tfRegMes: UITextField!
    @IBOutlet weak var tfRegYear: UITextField!
    
    var regNombre : String!
    
    override func viewDidLoad() {
        tfRegNombre.text = regNombre
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func atras(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func registrarse(_ sender: Any) {
        if (tfRegNombre.text == "" || tfRegMes.text == "" || tfRegDia.text == "" || tfRegYear.text == "" || tfRegCorreo.text == "" || tfRegPassword.text == "" || tfRegConfPassword.text == "") {
            let alerta = UIAlertController(title: "Error", message: "Llena todos los campos para poder registrarse.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        } else if let checarPass1 = tfRegPassword.text,
                let checarPass2 = tfRegConfPassword.text,
                checarPass1 != checarPass2 {
            let alerta = UIAlertController(title: "Error", message: "Las contraseñas ingresadas no coinciden.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        } else if (Int(tfRegYear.text!)! > 2022 || Int(tfRegYear.text!)! < 1900) {
            let alerta = UIAlertController(title: "Error", message: "Fecha de nacimiento inválida.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        } else {
            //let alerta = UIAlertController(title: "Usuario registrado", message: "La información se ha guardado con éxito.", preferredStyle: .alert)
            //let accion = UIAlertAction(title: "OK", style: .cancel)
            //alerta.addAction(accion)
            //present(alerta, animated: true)
            createUser(email: tfRegCorreo.text!, pass: tfRegPassword.text!, nombre: tfRegNombre.text!)
            
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
    
    func createUser(email: String, pass: String, nombre: String) {
        Auth.auth().createUser(withEmail: email, password: pass) {
            (user, error) in
            if let error = error {
                print("Error: " + error.localizedDescription)
            } else {
                //print("OK")
                self.nuevoUsuario(correo: email, contrasena: pass, nombre: nombre)
            }
        }
    }
    
    func nuevoUsuario(correo: String, contrasena: String, nombre: String){
        let db = Firestore.firestore()
        let _ = db.collection("paciente").addDocument(data: ["cintura": 0, "codigoEmparejamiento": 1, "contrasena": contrasena, "correo": correo, "estatura": 0, "fechaNacimiento": Timestamp(date: Date()), "idPaciente": correo, "nombre": nombre, "peso": 0, "sexo": ""]) { err in
            if let err = err {
                print("Error: " + err.localizedDescription)
            } else {
                //print("OK")
                
            }
            self.dismiss(animated: true)
        }
        //Inserta funcion para guardar en la BD
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
