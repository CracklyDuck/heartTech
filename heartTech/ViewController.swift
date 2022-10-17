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
        
        //intento de hacer circular la imagen, fallido  !!!!!!!
        //Borrar lo de abajo
        imgIniciarSesion.layer.masksToBounds = true
        imgIniciarSesion.layer.cornerRadius = imgIniciarSesion.bounds.width / 2
        
        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vistaRegistro"{
        }
    }
    
    @IBAction func verCreditos(_ sender: UIButton) {
        
    }
    
}

