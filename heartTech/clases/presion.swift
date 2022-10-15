//
//  presion.swift
//  heartTech
//
//  Created by Alumno on 15/10/22.
//

import UIKit

class presion: NSObject, Codable {
    var idPaciente: String!
    var fecha: Date
    var sistolica: Int!
    var diastolica: Int!
    var ritmo: Int!
    
    init(idPaciente: String, fecha: Date, sistolica: Int, diastolica: Int, ritmo: Int) {
        self.idPaciente = idPaciente
        self.fecha = Date()
        self.sistolica = sistolica
        self.diastolica = diastolica
        self.ritmo = ritmo
    }
}
