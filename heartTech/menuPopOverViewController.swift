//
//  menuPopOverViewController.swift
//  heartTech
//
//  Created by Alumno on 13/10/22.
//

import UIKit
import FirebaseAuth

class menuPopOverViewController: UIViewController {
    
    var paciente1: paciente!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: 200, height: 200)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrarSesión(_ sender: Any) {
        let view = presentingViewController
        let lobby = view?.presentingViewController
        if(logOut()) {
            lobby?.dismiss(animated: true)
        }
    }
    
    func logOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            print("Error al cerrar sesión")
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fichaMedica") {
            let ficha = segue.destination as! fichaMedicaViewController
            ficha.paciente2 = paciente1
            ficha.nombre = paciente1.nombre
            ficha.peso = String(paciente1.peso)
            ficha.altura = String(paciente1.estatura)
            ficha.cintura = String(paciente1.cintura)
            //menu.edge = topBar.UIRectEdge
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

}
