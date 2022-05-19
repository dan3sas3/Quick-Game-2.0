//
//  ProxJuegos.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct BuscarJuego: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var userGamesListVM = UserGameListViewModel()
    var body: some View {
        switch userGamesListVM.state {
        case .idle:
            Color.clear.onAppear(perform:userGamesListVM.getOtherGames)
        case .loading:
            ProgressView()
        case .failed:
            Text("Error cargando los juegos del usuario, intente mas tarde")
        case .loaded:
            List{
                ForEach(userGamesListVM.juegos, id:\.id){ juego in
                    NavigationLink(destination: ProxJuegosDetalle(
                        id_juego: juego.id,
                        cancha: juego.cancha,
                        direccion: juego.direccion,
                        image: juego.image,
                        fecha: juego.fecha,
                        latitud: juego.latitud,
                        longitud: juego.longitud,
                        userRegistered: false
                    ).environmentObject(GameViewModel()), label: {
                        VStack{
                            Text("Juego en: \(juego.cancha)")
                            AsyncImage(url: URL(string:juego.image)){image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200, alignment: .center)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    })
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Juegos Cercanos")
        }
    }
}

struct BuscarJuego_Previews: PreviewProvider {
    static var previews: some View {
        BuscarJuego()
    }
}

