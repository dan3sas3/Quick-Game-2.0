//
//  MenuPrincipal.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI


import SwiftUI

struct MenuPrincipal: View {
  var body: some View {
    NavigationView{
      List{
        NavigationLink(destination: ProxJuegos()) {
          Text("Próximos juegos")
        }

        NavigationLink(destination: CrearJuego()) {
          Text("Crear juego")
        }

        NavigationLink(destination: BuscarJuego()) {
          Text("Buscar juego")
        }
      }.navigationTitle("¡Bienvenido!")
    }.navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
   }
}
