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
  @State var showSuccessAlert = false
  @State private var isActive = false

  var body: some View {
      VStack {
        Form {
          Section(header: Text("Información básica")) {
              TextField("Nombre", text: $nombre).disableAutocorrection(true)
            TextField("Apellidos",text: $apellidos).disableAutocorrection(true)
              TextField("Correo electrónico", text: $correo).disableAutocorrection(true).autocapitalization(.none)

            Stepper(value: $edad, in: 18...100, label: {
              Text("Current age: \(self.edad)")
            })

            Menu {
              Button {
                  self.posicion = "Portero"
              } label: {
                  Text("Portero")
              }
              Button {
                  self.posicion = "Defensa"
              } label: {
                  Text("Defensa")
              }
              Button {
                  self.posicion = "Medio"
              } label: {
                  Text("Medio")
              }
              Button {
                  self.posicion = "Delantero"
              } label: {
                  Text("Delantero")
              }
            }label: {
                Text("\(self.posicion)")
                 Image(systemName: "heart.fill")
            }
          }

          Section(header: Text("Contraseña")) {
            SecureField("Contraseña", text: $password)
            SecureField("Verificar contrasela",text: $confirm_password)
          }

      }
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
          
          if (self.isUserInformationValid()) && (self.isPasswordValid()) {
              NavigationLink(destination: MenuPrincipal(), isActive: $isActive){
                Button(action: {
                    let params : [String:Any]  = ["nombres":  self.nombre , "apellidos": self.apellidos, "email": self.correo, "posicion_favorita": self.posicion, "password": self.password]
                    print("los parametros son \(params)")
                    myUserViewModel.registrarUsuario(parameters: params)
                    showSuccessAlert = true
                }){
                    Text("Guardar")
                }
                .alert("Registro Exitoso!", isPresented: $showSuccessAlert){
                    Button("OK", role:.cancel){
                        self.isActive = true
                    }
                }
              }
          }
      }
      .navigationBarTitle(Text("Crea tu perfil"))
      .background(Color(UIColor.systemGray6))
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
