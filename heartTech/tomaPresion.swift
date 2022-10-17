//
//  tomaPresion.swift
//  heartTech
//
//  Created by Alumno on 05/10/22.
//

import UIKit

class tomaPresion: UIViewController {
    
    @IBOutlet weak var tfSistolica1: UITextField!
    @IBOutlet weak var tfDiastolica1: UITextField!
    @IBOutlet weak var tfRitmo1: UITextField!
    
    @IBOutlet weak var tfSistolica2: UITextField!
    @IBOutlet weak var tfDiastolica2: UITextField!
    @IBOutlet weak var tfRitmo2: UITextField!
    
    @IBOutlet weak var tfSistolica3: UITextField!
    @IBOutlet weak var tfDiastolica3: UITextField!
    @IBOutlet weak var tfRitmo3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        
        if ((tfSistolica1.text! != "") || (tfDiastolica1.text! != "") || (tfRitmo1.text! != "")) {
            let alerta = UIAlertController(title: "Advertencia", message: "Salir sin guardar la información?", preferredStyle: .alert)
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
    
    @IBAction func guardarPresiones(_ sender: UIButton) {
        
        var promedioSist = 0
        var promedioDias = 0
        var promedioRitm = 0
        
        if (tfSistolica1.text! == "" && tfDiastolica1.text! == "" && tfRitmo1.text! == "") {
            let alerta = UIAlertController(title: "Error", message: "Llena al menos una medida de toma de presion", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel)
            alerta.addAction(accion)
            present(alerta, animated: true)
        } else {
            if (tfSistolica1.text! == "" || tfDiastolica1.text! == "" || tfRitmo1.text! == "") {
                let alerta = UIAlertController(title: "Error", message: "Campos faltantes en la medida 1", preferredStyle: .alert)
                let accion = UIAlertAction(title: "OK", style: .cancel)
                alerta.addAction(accion)
                present(alerta, animated: true)
            } else {
                promedioSist += Int(tfSistolica1.text!)!
                promedioDias += Int(tfDiastolica1.text!)!
                promedioRitm += Int(tfRitmo1.text!)!
                
                if (tfSistolica2.text! != "" && tfDiastolica2.text! != "" && tfRitmo2.text! != "") {
                    promedioSist += Int(tfSistolica2.text!)!
                    promedioDias += Int(tfDiastolica2.text!)!
                    promedioRitm += Int(tfRitmo2.text!)!
                    
                    if (tfSistolica3.text! != "" && tfDiastolica3.text! != "" && tfRitmo3.text! != "") {
                        promedioSist += Int(tfSistolica3.text!)!
                        promedioDias += Int(tfDiastolica3.text!)!
                        promedioRitm += Int(tfRitmo3.text!)!
                        promedioSist = promedioSist / 3
                        promedioDias = promedioDias / 3
                        promedioRitm = promedioRitm / 3
                        let vistaIni = presentingViewController as! lobbyViewController
                        //vistaIni.nuevaPresion(sistolica: promedioSist, diastolica: promedioDias, ritmo: promedioRitm)
                        print("Promedio Sistolica: " + String(promedioSist) + " Promedio Diastolica: " + String(promedioDias) + " Promedio Ritmo: " + String(promedioRitm))
                        dismiss(animated: true)
                    } else if(tfSistolica3.text! != "" || tfDiastolica3.text! != "" || tfRitmo3.text! != ""){
                        let alerta = UIAlertController(title: "Error", message: "Campos faltantes en la medida 3", preferredStyle: .alert)
                        let accion = UIAlertAction(title: "OK", style: .cancel)
                        alerta.addAction(accion)
                        present(alerta, animated: true)
                    } else {
                        promedioSist = promedioSist / 2
                        promedioDias = promedioDias / 2
                        promedioRitm = promedioRitm / 2
                        let vistaIni = presentingViewController as! lobbyViewController
                        //vistaIni.nuevaPresion(sistolica: promedioSist, diastolica: promedioDias, ritmo: promedioRitm)
                        print("Promedio Sistolica: " + String(promedioSist) + " Promedio Diastolica: " + String(promedioDias) + " Promedio Ritmo: " + String(promedioRitm))
                        dismiss(animated: true)
                    }
                } else if(tfSistolica2.text! != "" || tfDiastolica2.text! != "" || tfRitmo2.text! != ""){
                    let alerta = UIAlertController(title: "Error", message: "Campos faltantes en la medida 2", preferredStyle: .alert)
                    let accion = UIAlertAction(title: "OK", style: .cancel)
                    alerta.addAction(accion)
                    present(alerta, animated: true)
                } else {
                    let vistaIni = presentingViewController as! lobbyViewController
                    //vistaIni.nuevaPresion(sistolica: promedioSist, diastolica: promedioDias, ritmo: promedioRitm)
                    print("Promedio Sistolica: " + String(promedioSist) + " Promedio Diastolica: " + String(promedioDias) + " Promedio Ritmo: " + String(promedioRitm))
                    dismiss(animated: true)
                }
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
