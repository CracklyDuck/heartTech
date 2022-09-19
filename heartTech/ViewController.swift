//
//  ViewController.swift
//  heartTech
//
//  Created by Alumno on 19/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgIniciarSesion: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgIniciarSesion.layer.masksToBounds = true
           imgIniciarSesion.layer.cornerRadius = imgIniciarSesion.bounds.width / 2
        // Do any additional setup after loading the view.
    }


}

