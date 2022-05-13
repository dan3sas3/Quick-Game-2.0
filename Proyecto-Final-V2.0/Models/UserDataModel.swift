//
//  UserDataModel.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import Foundation
struct UserDataModel: Decodable {
    let error: Bool
    let message: String
    let data: [Usuario]
}

struct  Usuario: Decodable {
    let id: Int
    let nombres, apellidos, email, posicion_favorita, password: String
}
