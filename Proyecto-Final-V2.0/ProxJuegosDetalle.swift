//
//  ProxJuegosDetalle.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//


import SwiftUI
import MapKit

struct ProxJuegosDetalle: View {
  @EnvironmentObject var myGameViewModel: GameViewModel
  @Environment(\.presentationMode) var presentation;
    
  @State var id_juego = -1
  @State var cancha = ""
  @State var direccion = ""
  @State var image = ""
  @State var fecha = ""
  @State var latitud = ""
  @State var longitud = ""
  @State var userRegistered = false
  @State var isActive = false
  @State private var showAlert = false
  
  var body: some View {
      VStack{
        AsyncImage(url:URL(string: image)){image in
          image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
        }placeholder: {
          ProgressView()
        }
      }
      .navigationBarTitle("Mis Juegos", displayMode: .inline)
      VStack  {
        Text("Detalles del juego")
          .font(Font.system(size: 16, weight: .bold))
        Text("Lugar: \(cancha)")
          .padding()
        Text("Dirección: \(direccion)")
          .padding()
        Text("Fecha: \(fecha)")
          .padding()
      }.padding()// fin VStack
      Button(action: {
          self.isActive = true
      }){
          Text("Ver en Mapa")
              .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.black))
              .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white, buttonRadius: 10))
      }
      .overlay(
          NavigationLink(destination: LocalizacionJuego(
            cancha: self.cancha,
            latitud: self.latitud,
            longitud: self.longitud
          ), isActive: $isActive){
              EmptyView()
          }
      )
      if !self.$userRegistered.wrappedValue {
          Button(action:{
              myGameViewModel.registrarAJuego(parameters: [ "gameId" : id_juego])
              self.showAlert = true
          }){
              Text("Unirme al juego")
          }
          .alert("Registro Exitoso!", isPresented: $showAlert){
              Button("OK", role: .cancel){
                  showAlert = false
                  presentation.wrappedValue.dismiss()
              }
          }
      }
    }
}


struct ProxJuegosDetalle_Previews: PreviewProvider {
    static var previews: some View {
        ProxJuegosDetalle()
    }
}
