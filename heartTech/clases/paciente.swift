//
//  paciente.swift
//  heartTech
//
//  Created by Alumno on 13/10/22.
//

import UIKit

class paciente: NSObject, Codable {
    var idPaciente: Int!
    var correo: String!
    var contrasena: String!
    var nombre: String!
    var fechaNacimiento: Date!
    var sexo: String!
    var estatura: Float!
    var cintura: Float!
    var peso: Float!
    var codigoEmparejamiento: Double!
}
