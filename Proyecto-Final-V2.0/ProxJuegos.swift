//
//  ProxJuegos.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct ProxJuegos: View {
    var body: some View {
      List{
        NavigationLink(destination: ProxJuegosDetalle()) {
          VStack{
            Text("Estadio Azteca")
            AsyncImage(url:URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Estadio_Azteca_cancha_vista_norte.jpg/1200px-Estadio_Azteca_cancha_vista_norte.jpg")){image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
          }
        }

        NavigationLink(destination: ProxJuegosDetalle()) {
          VStack{
            Text("Estadio Azteca")
            AsyncImage(url:URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Estadio_Azteca_cancha_vista_norte.jpg/1200px-Estadio_Azteca_cancha_vista_norte.jpg")){image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
          }
        }
      }.navigationTitle("Próximos juegos")
    }
}

struct ProxJuegos_Previews: PreviewProvider {
    static var previews: some View {
        ProxJuegos()
    }
}
