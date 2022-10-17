//
//  fichaMedicaViewController.swift
//  heartTech
//
//  Created by Alumno on 10/10/22.
//

import UIKit

class fichaMedicaViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfDia: UITextField!
    @IBOutlet weak var tfMes: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var tfCintura: UITextField!
    @IBOutlet weak var btGuardar: UIButton!
    
    var listaInfo = [infoPaciente]()
    var defaults = UserDefaults.standard

    
    
    var regNombre : String!
    
    override func viewDidLoad() {
        
        //let vistaIni = presentingViewController as! ViewControllerRegistro
        //vistaIni.actualizaInt(mensajeRegresado: tfNombre.text!)
        
        super.viewDidLoad()
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(guardarInfo), name: UIApplication.didEnterBackgroundNotification, object: app)
        if FileManager.default.fileExists(atPath: dataFilePath().path){
            obtenerInfo()
        }
    }
    
    
    func dataFilePath() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = documentsDirectory.appendingPathComponent("Info").appendingPathExtension("plist")
        
        return pathArchivo
    }
    
    @IBAction func guardarInfo(){
        do {
            let data = try PropertyListEncoder().encode(listaInfo)
            try data.write(to: dataFilePath())
        }
        catch{
            print("Error al guardar")
        }
    }
    
    func obtenerInfo(){
        listaInfo.removeAll()
        do {
            let data = try Data.init(contentsOf: dataFilePath())
            listaInfo = try PropertyListDecoder().decode([infoPaciente].self, from: data)
        }
        catch{
            print("Error al leer los datos")
        }
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
        if tfPeso.text == "1"{
            let alerta = UIAlertController(title: "Datos no guardados", message: "Datos ingresados incorrectamente.", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        }
        else {
            //Que se quite al guardar ????
            
            //let alerta = UIAlertController(title: "Información registrada", message: "Los cambios se han guardado con éxito.", preferredStyle: .alert)
            //let accion = UIAlertAction(title: "OK", style: .cancel)
            //alerta.addAction(accion)
            //present(alerta, animated: true)
            self.dismiss(animated: true, completion: nil)
            

            
            /*
            let vistaIni = presentingViewController as! fichaMedicaViewController
            vistaIni.actualizaInterfaz(nomIngresado: tfNombre.text!, diaIngresado: tfDia.text!, mesIngresado: tfMes.text!, yearIngresado: tfYear.text!, pesoIngresado: tfPeso.text!, alturaIngresado: tfAltura.text!, cinturaIngresado: tfCintura.text!)
             */
            //dismiss(animated: true)
            
        }
        
    }
    
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
