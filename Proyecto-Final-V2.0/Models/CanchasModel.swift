//
//  CanchasModel.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 14/05/22.
//
//recordar que en la base datos quedaron las canchas con los siguientes ids:
//Estadio Azteca - 3
//El Polvorin - 4
//Estadio Azul - 6
//Universidad Anahuac - 7
//Ciudad Universitaria - 8
import Foundation
struct  Canchas: Decodable {
    let id, longitud, latitud: Int
    let nombres, direccion: String
}
