//
//  fichaMedicaViewController.swift
//  heartTech
//
//  Created by Alumno on 10/10/22.
//

import UIKit
import Firebase
import FirebaseAuth

class fichaMedicaViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfDia: UITextField!
    @IBOutlet weak var tfMes: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var tfCintura: UITextField!
    @IBOutlet weak var btGuardar: UIButton!
    
    var nombre: String!
    var peso: Float!
    var altura: Float!
    var cintura: Float!

    var email: String!
    
    var ident: String!
    
    var data1: [String: Any]!
    
    override func viewDidLoad() {
        if let curr = Auth.auth().currentUser {
            email = curr.email
            getPaciente()
        }
        
        
        //let vistaIni = presentingViewController as! ViewControllerRegistro
        //vistaIni.actualizaInt(mensajeRegresado: tfNombre.text!)
        
        super.viewDidLoad()
    }
    
    func getPaciente(){
        let db = Firestore.firestore()
        db.collection("paciente").whereField("idPaciente", isEqualTo: email).getDocuments(){ (QuerySnapshot, err) in
            if let err = err {
                print("Error al conseguir documentos: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    let data = document.data()
                    self.data1 = data
                    print(data["nombre"] as! String)
                    self.tfNombre.text = (data["nombre"] as! String)
                    self.tfPeso.text = String(data["peso"] as! Float)
                    self.tfAltura.text = String(data["estatura"] as! Float)
                    self.tfCintura.text = String(data["cintura"] as! Float)
                    self.ident = document.documentID
                }
            }
        }
    }
    
    
    func dataFilePath() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = documentsDirectory.appendingPathComponent("Info").appendingPathExtension("plist")
        
        return pathArchivo
    }
    
    
    @IBAction func regresarMenu(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func actualizaInterfaz(nomIngresado : String, diaIngresado : String, mesIngresado : String, yearIngresado : String, pesoIngresado : String, alturaIngresado : String, cinturaIngresado : String){
        tfNombre.text = nomIngresado
        tfDia.text = diaIngresado
        tfMes.text = mesIngresado
        tfYear.text = yearIngresado
        tfPeso.text = pesoIngresado
        tfAltura.text = alturaIngresado
        tfCintura.text = cinturaIngresado
    }
    
    @IBAction func btGuardarCambios(_ sender: UIButton) {
        if (tfNombre.text == "" || tfPeso.text == "" || tfAltura.text == "" || tfCintura.text == "") {
            let alerta = UIAlertController(title: "Error", message: "No se pueden guardar los cambios porque los datos no están completos", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        } else if tfPeso.text == "1"{
            let alerta = UIAlertController(title: "Datos no guardados", message: "Datos ingresados incorrectamente.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        }
        else {
            updateData(nombre: tfNombre.text!, peso: Float(tfPeso.text!)!, altura: Float(tfAltura.text!)!, cintura: Float(tfCintura.text!)!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    func updateData(nombre: String, peso: Float, altura: Float, cintura: Float) {
        let db = Firestore.firestore()
        self.data1["nombre"] = nombre
        self.data1["peso"] = peso
        self.data1["estatura"] = altura
        self.data1["cintura"] = cintura
        db.collection("paciente").document(self.ident).setData(self.data1) { error in
            if let error = error {
                print("Error: " + error.localizedDescription)
            } else {
                print("Información guardada")
            }
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
