//
//  ProxJuegosDetalle.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//


import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct ProxJuegosDetalle: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.427620, longitude: -99.160866), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1))

  var lugares = [
    Place(name: "Prueba", coordinate: CLLocationCoordinate2D(latitude: 19.426779, longitude: -99.167527))
  ]

  var body: some View {
      VStack  {
        Text("Detalles del juego")
          .font(Font.system(size: 16, weight: .bold))
        Text("Luegar: Estadio Azteca")
          .padding()
        Text("Dirección: Avenida Lol")
          .padding()
      }.padding()// fin VStack
      VStack{
        AsyncImage(url:URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Estadio_Azteca_cancha_vista_norte.jpg/1200px-Estadio_Azteca_cancha_vista_norte.jpg")){image in
          image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
        }placeholder: {
          ProgressView()
        }
      }

      VStack{
        Map(coordinateRegion: $region, annotationItems: lugares){ place in
          MapAnnotation(coordinate: place.coordinate) {
            NavigationLink {

            } label: {
              PlaceAnnotationView(title: place.name)
            }
          }
        }.frame(width: 400, height: 300)
      }
    }
}

struct ProxJuegosDetalle_Previews: PreviewProvider {
    static var previews: some View {
        ProxJuegosDetalle()
    }
}
