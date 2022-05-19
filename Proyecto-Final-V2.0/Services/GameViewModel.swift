//
//  GameViewModel.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import Foundation

class GameViewModel : ObservableObject
{
    @Published var juegos = [Juego]()
    @Published var regreso = JuegoDataModel(error: true, message: "", data: [Juego(id_cancha: 0, jugadores_min: 0, jugadores_max: 0,  timestamp: "")])
    @Published var registroResponse = RegistroJuegoResponse(error: true, message: "")
    let prefixUrl = "https://sucursales-sastre.glitch.me"
    func getJuegos()
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarjuegos") else
        {
            print("error url")
            return

        }
        URLSession.shared.dataTask(with: url)
        { (data,res,error) in

            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(JuegoDataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.juegos = result.data ?? []
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }

            }//fin del do
            catch let JsonError
            {
                print("error en json ", JsonError.localizedDescription)
             }


        }.resume() // fin dataTask
    }
    func creaJuego(parameters: [String: Any]) // parametrers es un diccionario
    {
        let defaults = UserDefaults.standard
        guard let url = URL(string: "\(prefixUrl)/crearjuego") else
        {
            print("error url")
            return

        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(defaults.string(forKey: "jsonwebtoken") ?? "no-access", forHTTPHeaderField: "Authorization")
        print(defaults.string(forKey: "jsonwebtoken") ?? "no-access")
        request.httpBody = data

        URLSession.shared.dataTask(with: request)
        { (data,res,error) in

            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(JuegoDataModel.self, from: d)
                    print("la data es \(result)")
                    DispatchQueue.main.async {
                        print("la data es \(result)")
                        self.regreso = result
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }

            }//fin del do
            catch let JsonError
            {
                print("error en json", JsonError.localizedDescription)
             }


        }.resume() // fin dataTask
    }
    func registrarAJuego(parameters: [String: Any]) // parametrers es un diccionario
    {
        let defaults = UserDefaults.standard
        guard let url = URL(string: "\(prefixUrl)/registrarjuego") else
        {
            print("error url")
            return

        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(defaults.string(forKey: "jsonwebtoken") ?? "no-access", forHTTPHeaderField: "Authorization")
        print(defaults.string(forKey: "jsonwebtoken") ?? "no-access")
        request.httpBody = data

        URLSession.shared.dataTask(with: request)
        { (data,res,error) in

            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(RegistroJuegoResponse.self, from: d)
                    print("la data es \(result)")
                    DispatchQueue.main.async {
                        print("la data es \(result)")
                        self.registroResponse = result
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }

            }//fin del do
            catch let JsonError
            {
                print("error en json", JsonError.localizedDescription)
             }


        }.resume() // fin dataTask
    }
}
