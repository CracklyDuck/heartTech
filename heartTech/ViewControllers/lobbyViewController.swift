//
//  lobbyViewController.swift
//  heartTech
//
//  Created by Alumno on 29/09/22.
//

import UIKit
import SwiftUI

class lobbyViewController: UIViewController {

    @IBOutlet weak var btMedida: UIButton!
    @IBOutlet weak var btHabitos: UIButton!
    @IBOutlet weak var btMedicamentos: UIButton!
    
    @IBOutlet weak var lbMensaje: UILabel!
    @IBOutlet weak var lbProximaCita: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func nuevaPresion(sistolica: Int, Diastolica: Int, ritmo: Int){
        //Inserta funcion para guardar en la BD
    }
    
    func habitos(ejercicio: Int, alimentacion: Int, estadoGeneral: Int) {
        //Inserta funcion para guardar en la BD
    }
    
    func medicamentos(faltantes: Int) {
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
