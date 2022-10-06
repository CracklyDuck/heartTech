//
//  tomaPresion.swift
//  heartTech
//
//  Created by Alumno on 05/10/22.
//

import UIKit

class tomaPresion: UIViewController {
    
    @IBOutlet weak var btAtras: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func guardarPresiones(_ sender: UIButton) {
        self.dismiss(animated: true)
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
