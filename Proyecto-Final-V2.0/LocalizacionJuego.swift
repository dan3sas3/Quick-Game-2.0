//
//  LocalizacionJuego.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 17/05/22.
//
import MapKit
import SwiftUI

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct LocalizacionJuego: View {
    @State var cancha = ""
    @State var latitud = ""
    @State var longitud = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.427620, longitude: -99.160866), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1))

    var body: some View {
        let lat = Double(self.latitud) ?? 19.427620
        let lon = Double(self.longitud) ?? -99.160866
        let lugares = [
          Place(name: cancha, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
        ]
        VStack{
          Map(coordinateRegion: $region, annotationItems: lugares){ place in
            MapAnnotation(coordinate: place.coordinate) {
              NavigationLink {

              } label: {
                PlaceAnnotationView(title: place.name)
              }
            }
          }
        }.onAppear {
            let lat = Double(self.latitud) ?? 19.427620
            let lon = Double(self.longitud) ?? -99.160866
            self.region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1))
        }
    }
    
    
}

struct LocalizacionJuego_Previews: PreviewProvider {
    static var previews: some View {
        LocalizacionJuego()
    }
}
