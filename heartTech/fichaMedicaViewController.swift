//
//  fichaMedicaViewController.swift
//  heartTech
//
//  Created by Alumno on 10/10/22.
//

import UIKit

class fichaMedicaViewController: UIViewController {
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfDia: UITextField!
    @IBOutlet weak var tfMes: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var tfCintura: UITextField!
    @IBOutlet weak var btGuardar: UIButton!
    
    var nombreEscrito : String!
    var diaEscrito : String!
    var mesEscrito : String!
    var yearEscrito : String!
    var pesoEscrito : String!
    var alturaEscrito : String!
    var cinturaEscrito : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        tfNombre.text = nombreEscrito
        tfDia.text = diaEscrito
        tfMes.text = mesEscrito
        tfYear.text = yearEscrito
        tfPeso.text = pesoEscrito
        tfAltura.text = alturaEscrito
        tfCintura.text = cinturaEscrito
        actualizaInterfaz(nomIngresado: tfNombre.text!, diaIngresado: tfDia.text!, mesIngresado: tfMes.text!, yearIngresado: tfYear.text!, pesoIngresado: tfPeso.text!, alturaIngresado: tfAltura.text!, cinturaIngresado: tfCintura.text!)
         */
         
        // Do any additional setup after loading the view.
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
        //if let nombre = tfNombre.text, !nombre.isEmpty{
        //let nombre = tfNombre.text
        //if ((nombre?.isEmpty) != nil){
        if tfNombre.text == "" || tfMes.text == "" || tfDia.text == "" || tfYear.text == ""{
           //let dia = tfDia.text, !dia.isEmpty,
           //let mes = tfMes.text, !mes.isEmpty,
           //let year = tfYear.text, !year.isEmpty {
            let alerta = UIAlertController(title: "Error", message: "No se pueden guardar los cambios porque hay campos vacíos.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        }
        else {
            //Que se quite al guardar ????
            self.dismiss(animated: true, completion: nil)
            /*
            let vistaIni = presentingViewController as! fichaMedicaViewController
            vistaIni.actualizaInterfaz(nomIngresado: tfNombre.text!, diaIngresado: tfDia.text!, mesIngresado: tfMes.text!, yearIngresado: tfYear.text!, pesoIngresado: tfPeso.text!, alturaIngresado: tfAltura.text!, cinturaIngresado: tfCintura.text!)
             */
            dismiss(animated: true)
            
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
