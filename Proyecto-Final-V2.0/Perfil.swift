//
//  Perfil.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 19/05/22.
//

import SwiftUI

struct Perfil: View {
    @State var userInfo = PerfilUsuarioModel(nombre: "", apellidos: "", email: "", posicion_favorita: "" , message: "")
    
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Nombre")) {
                    Text(userInfo.nombre!)
                }
                Section(header: Text("Apellido")) {
                      Text(userInfo.apellidos!)
                }
                Section(header: Text("Email")) {
                      Text(userInfo.email!)
                }
                Section(header: Text("Posicion")) {
                      Text(userInfo.posicion_favorita!)
                }
            }
        }
        .onAppear {
            getPerfil()
        }
        .navigationTitle("Perfil")
    }
    
    func getPerfil()
    {
        let defaults = UserDefaults.standard
        guard let url = URL(string: "https://sucursales-sastre.glitch.me/perfil") else
        {
            print("error url")
            return

        }
        var request = URLRequest(url: url)
        request.setValue(defaults.string(forKey: "jsonwebtoken") ?? "no-access", forHTTPHeaderField: "Authorization")
        print(defaults.string(forKey: "jsonwebtoken") ?? "no-access")
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
                    let result = try JSONDecoder().decode(PerfilUsuarioModel.self, from: d)
                    DispatchQueue.main.async {
                        self.userInfo = result
                        print(result)
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
        return
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
