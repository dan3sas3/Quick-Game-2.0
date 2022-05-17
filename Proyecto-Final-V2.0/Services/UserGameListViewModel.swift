//
//  UserGameViewModel.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 16/05/22.
//

import Foundation

class UserGameListViewModel: ObservableObject {
    enum State{
        case idle
        case loading
        case failed
        case loaded
    }
    @Published private(set) var state = State.idle
    @Published var juegos: [UserGameViewModel] = []
    func getUserGames(){
        state = .loading
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else{
            return
        }
        LoginService().getUserGames(token: token){ (result) in
            switch result {
                case .success(let juegos):
                DispatchQueue.main.async{
                    self.juegos = juegos.map(UserGameViewModel.init)
                    self.state = .loaded
                }
                case .failure(let error):
                    print(error.localizedDescription)
                self.state = .failed
            }
        }
    }
}

struct UserGameViewModel {
    let juego: UserJuego
    var id: Int {
        return juego.id_juego
    }
    var cancha: String {
        return juego.lugar
    }
    var direccion: String {
        return juego.direccion
    }
    var fecha: String{
        return juego.timestamp
    }
    var latitud: String {
        return juego.latitud
    }
    var longitud: String {
        return juego.longitud
    }
    var image: String{
        if(juego.lugar == "Estadio Azteca"){
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Estadio_Azteca_cancha_vista_norte.jpg/1200px-Estadio_Azteca_cancha_vista_norte.jpg"
        }else if(juego.lugar == "El Polvorín"){
            return "https://fastly.4sqi.net/img/general/200x200/59605406_FAgvhYhwnQa-L-pM0Dpoo6N8goGXkB4ykEqpM8CmDsM.jpg"
        }else if(juego.lugar == "Estadio Azul"){
            return "https://www.futboltotal.com.mx/wp-content/uploads/2020/04/dos-anos-despues-de-su-ultimo-juego-asi-luce-el-estadio-azul.jpg"
        }else if(juego.lugar == "Universidad Anáhuac"){
            return "https://pbs.twimg.com/media/DeNbS_KU8AAK61u.jpg"
        }else{
            return "https://upload.wikimedia.org/wikipedia/commons/5/56/Estadio_olimpico_universitario_unam.jpg"
        }
    }
}
