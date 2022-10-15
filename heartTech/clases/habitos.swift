//
//  habitos.swift
//  heartTech
//
//  Created by Alumno on 15/10/22.
//

import UIKit
import Firebase

class habitos: NSObject, Codable {
    var idPaciente: String!
    var fecha: Date!
    var satisfaccion: Int!
    var alimentacion: Int!
    var ejercicio: Int!
    
    init(idPaciente: String, fecha: Date, satisfaccion: Int, alimentacion: Int, ejercicio: Int) {
        self.idPaciente = idPaciente
        self.fecha = Date()
        self.satisfaccion = satisfaccion
        self.alimentacion = alimentacion
        self.ejercicio = ejercicio
    }
}
