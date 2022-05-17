//
//  UserViewModel.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import Foundation

class UserViewModel : ObservableObject
{
    @Published var usuarios = [Usuario]()
    @Published var regreso = UserDataModel(error: true, message: "", data: [Usuario(id: 0, nombres: "", apellidos: "", email: "", posicion_favorita: "", password: "")])
    let prefixUrl = "https://sucursales-sastre.glitch.me/"
    func getUsuarios()
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarusuarios") else
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
                    let result = try JSONDecoder().decode(UserDataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.usuarios = result.data
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
    func registrarUsuario(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "\(prefixUrl)/registrar") else
        {
            print("error url")
            return

        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


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
                    let result = try JSONDecoder().decode(UserDataModel.self, from: d)
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
}
