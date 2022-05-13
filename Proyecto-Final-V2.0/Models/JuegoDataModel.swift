//
//  JuegoDataModel.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import Foundation
struct JuegoDataModel: Decodable {
    let error: Bool
    let message: String
    let data: [Juego]
}

struct  Juego: Decodable {
  let id_juego, id_cancha, jugadores_min, jugadores_max: Int
  let timestamp: String
}
