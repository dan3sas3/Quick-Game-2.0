//
//  LoginService.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 15/05/22.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable{
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class LoginService{
    func getUserGames(token: String, completion: @escaping (Result<[UserJuego], NetworkError>) -> Void){
        guard let url = URL(string:"https://sucursales-sastre.glitch.me/juegosusuario") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url:url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let juegos = try? JSONDecoder().decode([UserJuego].self, from:data) else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(juegos))
            
        }.resume()
    }
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void){
        guard let url = URL(string: "https://sucursales-sastre.glitch.me/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBody(email:email, password:password)
        print(body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from:data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            guard let token = loginResponse.token else{
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            
        }.resume()
        
        
    }
}
