//
//  ProxJuegos.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct ProxJuegos: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var userGamesListVM = UserGameListViewModel()
    var body: some View {
        switch userGamesListVM.state {
        case .idle:
            Color.clear.onAppear(perform:userGamesListVM.getUserGames)
        case .loading:
            ProgressView()
        case .failed:
            Text("Error cargando los juegos del usuario, intente mas tarde")
        case .loaded:
            NavigationView{
                List{
                    ForEach(userGamesListVM.juegos, id:\.id){ juego in
                        NavigationLink(destination: ProxJuegosDetalle(), label: {
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
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Proximos Juegos")
        }
    }
}

struct ProxJuegos_Previews: PreviewProvider {
    static var previews: some View {
        ProxJuegos()
    }
}
