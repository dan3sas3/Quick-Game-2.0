//
//  UserDetalle.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct UserDetalle: View {
  @State private var index = 0
  var body: some View {


      VStack{

          HStack(spacing: 15){

              Button(action: {

              }) {

                  Image(systemName: "chevron.left")
                      .font(.system(size: 22))
                      .foregroundColor(.black)
              }

              Text("Profile")
                  .font(.title)

              Spacer(minLength: 0)

              Button(action: {

              }) {

                  Text("Add")
                      .foregroundColor(.white)
                      .padding(.vertical, 10)
                      .padding(.horizontal, 25)
                      .background(Color("Color"))
                      .cornerRadius(10)
              }
          }
          .padding()

          HStack{

              VStack(spacing: 0){

                  Rectangle()
                  .fill(Color("Color"))
                  .frame(width: 80, height: 3)
                  .zIndex(1)


                  // going to apply shadows to look like neuromorphic feel...
                  Image("profile")
                  .resizable()
                  .frame(width: 100, height: 100)
                  .padding(.top, 6)
                  .padding(.bottom, 4)
                  .padding(.horizontal, 8)
                  .background(Color("Color1"))
                  .cornerRadius(10)
                  .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                  .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
              }

              VStack(alignment: .leading, spacing: 12){

                  Text("Nombre")
                      .font(.title)
                      .foregroundColor(Color.black.opacity(0.8))

                  Text("Posición")
                      .foregroundColor(Color.black.opacity(0.7))
                      .padding(.top, 8)

                  Text("Mail")
                      .foregroundColor(Color.black.opacity(0.7))
              }
              .padding(.leading, 20)

              Spacer(minLength: 0)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)

        Spacer(minLength: 20)
        HStack{
          VStack{
            Text("Bio")
            Text("Edad")
          }
        }

          // Tab Items...
//          HStack{
//
//              Button(action: {
//
//                  self.index = 0
//
//              }) {
//
//                  Text("Experinces")
//                      .foregroundColor(self.index == 0 ? Color.white : .gray)
//                      .padding(.vertical, 10)
//                      .padding(.horizontal)
//                      .background(self.index == 0 ? Color("Color") : Color.clear)
//                      .cornerRadius(10)
//              }
//
//              Spacer(minLength: 0)
//
//              Button(action: {
//
//                  self.index = 1
//
//              }) {
//
//                  Text("Rates")
//                      .foregroundColor(self.index == 1 ? Color.white : .gray)
//                      .padding(.vertical, 10)
//                      .padding(.horizontal)
//                      .background(self.index == 1 ? Color("Color") : Color.clear)
//                      .cornerRadius(10)
//              }
//
//              Spacer(minLength: 0)
//
//              Button(action: {
//
//                  self.index = 2
//
//              }) {
//
//                  Text("Charts")
//                      .foregroundColor(self.index == 2 ? Color.white : .gray)
//                      .padding(.vertical, 10)
//                      .padding(.horizontal)
//                      .background(self.index == 2 ? Color("Color") : Color.clear)
//                      .cornerRadius(10)
//              }
//          }
//          .padding(.horizontal,8)
//          .padding(.vertical,5)
//          .background(Color("Color1"))
//          .cornerRadius(8)
//          .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//          .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//          .padding(.horizontal)
//          .padding(.top,25)
          // Cards...
//          HStack(spacing: 20){
//
//              VStack(spacing: 12){
//
//                  Image("twitter")
//                  .resizable()
//                  .frame(width: 80, height: 80)
//
//                  Text("Twitter")
//                      .font(.title)
//                      .padding(.top,10)
//
//                  Text("UI Designer")
//                      .foregroundColor(Color("Color"))
//
//                  Text("1 Year")
//                      .font(.caption)
//                      .foregroundColor(.gray)
//              }
//              .padding(.vertical)
//              // half screen - spacing - two side paddings = 60
//              .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//              .background(Color("Color1"))
//              .cornerRadius(15)
//              .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//              .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//              // shadows...
//
//              VStack(spacing: 12){
//
//                  Image("apple")
//                  .resizable()
//                  .frame(width: 80, height: 80)
//
//                  Text("Apple")
//                      .font(.title)
//                      .padding(.top,10)
//
//                  Text("UI/UX Designer")
//                      .foregroundColor(Color("Color"))
//
//                  Text("3 Year")
//                      .font(.caption)
//                      .foregroundColor(.gray)
//              }
//              .padding(.vertical)
//              // half screen - spacing - two side paddings = 60
//              .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//              .background(Color("Color1"))
//              .cornerRadius(15)
//              .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//              .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//              // shadows...
//
//          }
//          .padding(.top,20)
//          HStack(spacing: 20){
//
//              VStack(spacing: 12){
//
//                  Image("pinterest")
//                  .resizable()
//                  .frame(width: 80, height: 80)
//
//                  Text("Pinterest")
//                      .font(.title)
//                      .padding(.top,10)
//
//                  Text("UI Designer")
//                      .foregroundColor(Color("Color"))
//
//                  Text("2 Year")
//                      .font(.caption)
//                      .foregroundColor(.gray)
//              }
//              .padding(.vertical)
//              // half screen - spacing - two side paddings = 60
//              .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//              .background(Color("Color1"))
//              .cornerRadius(15)
//              .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//              .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//              // shadows...
//
//              VStack(spacing: 12){
//
//                  Image("fb")
//                  .resizable()
//                  .frame(width: 80, height: 80)
//
//                  Text("Facebook")
//                      .font(.title)
//                      .padding(.top,10)
//
//                  Text("UX Designer")
//                      .foregroundColor(Color("Color"))
//
//                  Text("1 Year")
//                      .font(.caption)
//                      .foregroundColor(.gray)
//              }
//              .padding(.vertical)
//              // half screen - spacing - two side paddings = 60
//              .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//              .background(Color("Color1"))
//              .cornerRadius(15)
//              .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//              .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//              // shadows...
//
//          }
//          .padding(.top,20)
          Spacer(minLength: 0)
      }
      .background(Color("Color1").edgesIgnoringSafeArea(.all))
    }
}

struct UserDetalle_Previews: PreviewProvider {
    static var previews: some View {
        UserDetalle()
    }
}
