//
//  RegistroUser.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI
//prueba
struct RegistroUser: View {
  @EnvironmentObject var myUserViewModel: UserViewModel

  //private let oldPasswordToConfirmAgainst = "12345"
  @State private var nombre = ""
  @State private var apellidos = ""
  @State private var edad = 20
  @State private var correo = ""
  @State private var posicion = "Posición preferida"
  @State private var bio = ""
  @State private var password = ""
  @State private var confirm_password = ""
  @State private var style = 0

  @State private var keyboardOffset: CGFloat = 0

  var body: some View {
      VStack {
        Form {
          Section(header: Text("Información básica")) {
            TextField("Nombre", text: $nombre)
            TextField("Apellidos",text: $apellidos)
            TextField("Correo electrónico", text: $correo)

            Stepper(value: $edad, in: 18...100, label: {
              Text("Current age: \(self.edad)")
            })

            Menu {
              Button {
                  posicion = "Portero"
              } label: {
                  Text("Portero")
              }
              Button {
                  posicion = "Defensa"
              } label: {
                  Text("Defensa")
              }
              Button {
                  posicion = "Medio"
              } label: {
                  Text("Medio")
              }
              Button {
                  posicion = "Delantero"
              } label: {
                  Text("Delantero")
              }
            }label: {
                 Text("\(posicion)")
                 Image(systemName: "heart.fill")
            }
          }

          Section(header: Text("Contraseña")) {
            SecureField("Contraseña", text: $password)
            SecureField("Verificar contrasela",text: $confirm_password)
          }

          if (self.isUserInformationValid()) && (self.isPasswordValid()) {
            Button(action: {
              var params : [String:Any]  = ["nombres":  self.nombre , "apellidos": self.apellidos, "email": self.correo, "posicion_favorita": self.posicion, "password": self.password]
                print("los parametros son \(params)")
              myUserViewModel.registrarUsuario(parameters: params)
              myUserViewModel.getUsuarios()


                    },
                   label:{
                Text("Guardar")
            })
          }

      }.navigationBarTitle(Text("Crea tu perfil"))

      .offset(y: -self.keyboardOffset)
      .onAppear {
        NotificationCenter.default.addObserver(
          forName: UIResponder.keyboardDidShowNotification,
          object: nil,
          queue: .main) { (notification) in
            NotificationCenter.default.addObserver(
              forName: UIResponder.keyboardDidShowNotification,
              object: nil,
              queue: .main) { (notification) in
                guard let userInfo = notification.userInfo,
                let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

                self.keyboardOffset = keyboardRect.height
              }

              NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardDidHideNotification,
                object: nil,
                queue: .main) { (notification) in
                  self.keyboardOffset = 0
                }
          }
        }
      }.background(Color(UIColor.systemGray6))
  }


  private func isUserInformationValid() -> Bool {
    if nombre.isEmpty {
        return false
    }

    if apellidos.isEmpty {
        return false
    }

    return true
  }

  private func isPasswordValid() -> Bool {

    if !password.isEmpty && password == confirm_password {
        return true
    }

    return false
  }
}

struct RegistroUser_Previews: PreviewProvider {
    static var previews: some View {
        RegistroUser()
    }
}
