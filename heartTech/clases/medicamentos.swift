//
//  medicamentos.swift
//  heartTech
//
//  Created by Alumno on 15/10/22.
//

import UIKit

class medicamentos: NSObject, Codable {
    var idPaciente: Int!
    var fecha: Date!
    var faltantes: Int!
    
    init(idPaciente: Int, fecha: Date, faltantes: Int) {
        self.idPaciente = idPaciente
        self.fecha = Date()
        self.faltantes = faltantes
    }
}
