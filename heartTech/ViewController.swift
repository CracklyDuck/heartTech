//
//  ViewController.swift
//  heartTech
//
//  Created by Alumno on 19/09/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var imgIniciarSesion: UIImageView!
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //intento de hacer circular la imagen, fallido  !!!!!!!
        //Borrar lo de abajo
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btIniciarSesion(_ sender: Any) {
        if let correo = tfUsuario.text,
           let contra = tfContrasena.text {
            login(email: correo, pass: contra)
        }
    }
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func login(email: String, pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass) {
            (user, error) in
            if let error = error {
                print("Error: " + error.localizedDescription)
                //return false
            } else {
                self.performSegue(withIdentifier: "lobby", sender: nil)
            }
        }
    }
    
}

