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
    
    var promedioSist: Float!
    var promedioDias: Float!
    var promedioRitm: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func guardarPresiones(_ sender: UIButton) {
        let vistaIni = presentingViewController as! lobbyViewController
        vistaIni.nuevaPresion(sistolica: <#T##Int#>, Diastolica: <#T##Int#>, ritmo: <#T##Int#>)
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
