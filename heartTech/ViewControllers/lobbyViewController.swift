//
//  lobbyViewController.swift
//  heartTech
//
//  Created by Alumno on 29/09/22.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseCore

class lobbyViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    var correo = "trejo.fabian@hotmail.com"
    
    var paciente: paciente!

    @IBOutlet weak var btMedida: UIButton!
    @IBOutlet weak var btHabitos: UIButton!
    @IBOutlet weak var btMedicamentos: UIButton!
    
    @IBOutlet weak var lbMensaje: UILabel!
    @IBOutlet weak var lbProximaCita: UILabel!
    
    @IBOutlet weak var topBar: UIView!
    
    override func viewDidLoad() {
        //getPaciente()
        //self.paciente.nombre = "Fabian"
        //lbMensaje.text = "¡Bienvenido " + paciente.nombre + "!"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getPaciente() {
        let db = Firestore.firestore()
        db.collection("paciente").whereField("idPaciente", isEqualTo: correo).getDocuments(){ (QuerySnapshot, err) in
            if let err = err {
                print("Error al conseguir documentos: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    let data = document.data()
                    self.paciente.idPaciente = self.correo
                    self.paciente.correo = self.correo
                    self.paciente.nombre = (data["nombre"] as! String)
                
                    //HACER EL RESTO
                }
            }
            
        }
    }
    
    
    func nuevaPresion(sistolica: Int, diastolica: Int, ritmo: Int){
        let db = Firestore.firestore()
        let _ = db.collection("registroPresion").addDocument(data: ["idPaciente": paciente.idPaciente!, "fecha": Timestamp(date: Date()), "sistolica": sistolica, "diastolica": diastolica, "ritmo": ritmo]) { err in
            if err == nil {
                print("Error al postear presion")
            } else {
                print("OK")
            }
        }
        //Inserta funcion para guardar en la BD
    }
    
    func habitos(ejercicio: Int, alimentacion: Int, estadoGeneral: Int) {
        let db = Firestore.firestore()
        let _ = db.collection("registroHabitos").addDocument(data: ["idPaciente": paciente.idPaciente!, "fecha": Timestamp(date: Date()), "ejercicio": ejercicio, "alimentacion": alimentacion, "satisfaccion": estadoGeneral]) { err in
            if err == nil {
                print("Error al postear habitos")
            } else {
                print("OK")
            }
        }
        //Inserta funcion para guardar en la BD
    }
    
    func medicamentos(faltantes: Int) {
        let db = Firestore.firestore()
        let _ = db.collection("registroMedicamentos").addDocument(data: ["idPaciente": paciente.idPaciente!, "fecha": Timestamp(date: Date()), "tomado": faltantes]) { err in
            if err == nil {
                print("Error al postear medicamentos")
            } else {
                print("OK")
            }
        }
        //Inserta funcion para guardar en la BD
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "menuPopOver") {
            let menu = segue.destination as! menuPopOverViewController
            menu.popoverPresentationController?.delegate = self
            menu.height = view.frame.size.height
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
