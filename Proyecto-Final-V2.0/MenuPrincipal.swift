//
//  MenuPrincipal.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI


import SwiftUI

struct MenuPrincipal: View {
  @StateObject private var loginVM = LoginViewModel()
  @Environment(\.presentationMode) var presentation;
  var body: some View {
    NavigationView{
      List{
        NavigationLink(destination: ProxJuegos()) {
          Text("Próximos juegos")
        }

          NavigationLink(destination: CrearJuego().environmentObject(GameViewModel())) {
          Text("Crear juego")
        }

        NavigationLink(destination: BuscarJuego()) {
          Text("Buscar juego")
        }
      }
      .navigationTitle("¡Bienvenido!")
      .toolbar {
          ToolbarItem(placement: .bottomBar){
              Button("Logout", action:{
                  loginVM.signout()
                  presentation.wrappedValue.dismiss()
              })
//             {
//                  NavigationLink(destination: Login().navigationBarBackButtonHidden(true)){
//                      Text("Logout")
//                  }
//              }
          }
      }
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    
  }
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
   }
}
