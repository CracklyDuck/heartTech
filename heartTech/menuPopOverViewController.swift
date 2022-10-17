//
//  menuPopOverViewController.swift
//  heartTech
//
//  Created by Alumno on 13/10/22.
//

import UIKit

class menuPopOverViewController: UIViewController {
    
    var height: CGFloat!
    var edge: UIRectEdge!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: 200, height: 200)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrarSesión(_ sender: Any) {
        let view = presentingViewController
        let lobby = view?.presentingViewController
        lobby?.dismiss(animated: true)
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
