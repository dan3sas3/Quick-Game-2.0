//
//  CrearJuego.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI
//prueba
struct CrearJuego: View {
  @EnvironmentObject var myGameViewModel: GameViewModel
  @Environment(\.presentationMode) var presentation;
    
  @State private var fecha = Date()
  @State private var jugadoresMin = 4
  @State private var jugadoresMax = 10
  @State private var lugarSeleccionado = "Estadio Azteca"
    
  @State private var showSuccessAlert = false
  @State var selection: Int? = nil
    

  let posiblesLugares = ["Estadio Azteca", "El Polvorín", "Estadio Azul", "Universidad Anáhuac", "Ciudad Universitaria"]

  @State private var keyboardOffset: CGFloat = 0

  var body: some View {
      VStack {
        Form {
          Section(header: Text("Información de juego")) {
            DatePicker(
              "Fecha",
              selection: $fecha
            )
            Stepper(value: $jugadoresMin, in: 3...25, label: {
              Text("Jugadores Mínimos: \(self.jugadoresMin)")
            })
            Stepper(value: $jugadoresMax, in: 3...25, label: {
              Text("Jugadores Máximos: \(self.jugadoresMax)")
            })
            Picker("Lugar del Juego", selection: $lugarSeleccionado) {
              ForEach(posiblesLugares, id: \.self){
                Text($0)
              }
            }


      }.navigationBarTitle(Text("Crea un juego"))

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
      //NavigationLink(destination: MenuPrincipal(), tag:1, selection: $selection){
      Button(action: {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-5")
        var id_cancha = 3;
          if(lugarSeleccionado == "Estadio Azteca"){
              id_cancha = 3
          }else if(lugarSeleccionado == "El Polvorín"){
              id_cancha = 4
          }else if(lugarSeleccionado == "Estadio Azul"){
              id_cancha = 6
          }else if(lugarSeleccionado == "Universidad Anáhuac"){
              id_cancha = 7
          }else{
              id_cancha = 8
          }
          let params : [String:Any] = ["idCancha":id_cancha, "timestamp":dateFormatter.string(from: fecha),"jugadoresMin":self.jugadoresMin, "jugadoresMax":self.jugadoresMax];
          myGameViewModel.creaJuego(parameters: params)
          showSuccessAlert = true
          
      }){
          Text("CREAR".uppercased())
              .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.black))
              .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white.opacity(0.15), buttonRadius: 10))
      }.alert("Juego creado exitosamente!", isPresented: $showSuccessAlert){
          Button("OK", role:.cancel){
              showSuccessAlert = false;
              presentation.wrappedValue.dismiss()
          }
          //}
      }
    }
  }
}

struct CrearJuego_Previews: PreviewProvider {
    static var previews: some View {
      CrearJuego()
    }
}
