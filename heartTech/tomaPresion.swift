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
            let alerta = UIAlertController(title: "Error", message: "Salir sin guardar la información?", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Sí", style: .default) {action in
                self.dismiss(animated: true)
            }
            alerta.addAction(accion)
            let accionCancelar = UIAlertAction(title: "No", style: .destructive)
            alerta.addAction(accionCancelar)
            present(alerta, animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @IBAction func guardarPresiones(_ sender: UIButton) {
        
        var promedioSist: Int!
        var promedioDias: Int!
        var promedioRitm: Int!
        
        if let sis1 = Int(tfSistolica1.text!),
           let dia1 = Int(tfDiastolica1.text!),
           let ritm1 = Int(tfRitmo1.text!) {
            promedioSist += sis1
            promedioDias += dia1
            promedioRitm += ritm1
            
            if let sis2 = Int(tfSistolica2.text!),
               let dia2 = Int(tfDiastolica2.text!),
               let ritm2 = Int(tfRitmo2.text!) {
                promedioSist += sis2
                promedioDias += dia2
                promedioRitm += ritm2
                
                if let sis3 = Int(tfSistolica3.text!),
                   let dia3 = Int(tfDiastolica3.text!),
                   let ritm3 = Int(tfRitmo3.text!) {
                    promedioSist += sis3
                    promedioDias += dia3
                    promedioRitm += ritm3
                    
                }
            }
        }
        
        promedioSist = Int(tfDiastolica1.text! + tfDiastolica1.text! + tfDiastolica1.text!)! / 3
        promedioDias = Int(tfDiastolica1.text! + tfDiastolica1.text! + tfDiastolica1.text!)! / 3
        promedioRitm = Int(tfRitmo1.text! + tfRitmo1.text! + tfRitmo1.text!)! / 3
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.nuevaPresion(sistolica: promedioSist, Diastolica: promedioDias, ritmo: promedioRitm)
        dismiss(animated: true)
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
