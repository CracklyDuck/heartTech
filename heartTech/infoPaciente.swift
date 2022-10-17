//
//  infoPaciente.swift
//  heartTech
//
//  Created by Nora Villarreal on 17/10/22.
//

import UIKit

class infoPaciente: Codable {
    var nombre : String
    var dia : String!
    var mes : String!
    var year : String!
    var peso : String!
    var altura : String!
    var cintura : String!
    
    init(nombre : String, dia: String, mes : String, year : String, peso : String, altura : String, cintura : String) {
        self.nombre = nombre
        self.dia = dia
        self.mes = mes
        self.year = year
        self.peso = peso
        self.altura = altura
        self.cintura = cintura
    }
}
