//
//  paciente.swift
//  heartTech
//
//  Created by Alumno on 13/10/22.
//

import UIKit

class paciente: NSObject, Codable {
    var idPaciente: String!
    var correo: String!
    var contrasena: String!
    var nombre: String!
    var fechaNacimiento: Date!
    var sexo: String!
    var estatura: Float!
    var cintura: Float!
    var peso: Float!
    var codigoEmparejamiento: Double!
    
    init(idPaciente: String, correo: String, contrasena: String, nombre: String, fechaNacimiento: Date, sexo: String, estatura: Float, cintura: Float, peso: Float, codigoEmparejamiento: Double!) {
        self.idPaciente = idPaciente
        self.correo = correo
        self.contrasena = contrasena
        self.nombre = nombre
        self.fechaNacimiento = fechaNacimiento
        self.sexo = sexo
        self.estatura = estatura
        self.cintura = cintura
        self.peso = peso
        self.codigoEmparejamiento = codigoEmparejamiento
    }
}
