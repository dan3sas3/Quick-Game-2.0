//
//  Login.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct Login: View {
    @StateObject private var loginVM = LoginViewModel()
    //MARK:- PROPERTIES
    //recordar que username es mas bien email
    @State private var username = ""
    @State private var password = ""

    var body: some View {
      NavigationView{
        ZStack{
            //Bg
            Image("")
                .resizable()
                .overlay(
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.65))
                )
                .ignoresSafeArea(.all)

            VStack{
                //Logo
                Image("logo-1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.top,45)
                Text("Quick Game")
                    .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 40, fontColor: Color.white))
                Spacer()
                // Form
                VStack(spacing: 15){
                    VStack(alignment: .center, spacing: 30){
                        VStack(alignment: .center) {
                            CustomTextfield(placeholder:
                                                Text("Email"),
                                            fontName: "OpenSans-Regular",
                                            fontSize: 18,
                                            fontColor: Color.white.opacity(0.3),
                                            username: $username)
                            Divider()
                                .background(Color.white)
                        }
                        VStack(alignment: .center) {
                            CustomSecureField(placeholder:
                                                Text("Contraseña"),
                                              fontName: "OpenSans-Regular",
                                              fontSize: 18,
                                              fontColor: Color.white.opacity(0.3),
                                              password: $password)
                            Divider()
                                .background(Color.white)
                        }
                    }
                    HStack{
                        Button(action: {}){
                            Text("Olvidaste tu contraseña?")
                                .modifier(CustomTextM(fontName: "OpenSans-Regular", fontSize: 14, fontColor: Color.white.opacity(0.65)))
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal,35)

                //Button
                //NavigationLink(destination: MenuPrincipal(), isActive: $isActive){
                    Button(action: {
                        loginVM.email = self.username
                        loginVM.password = self.password
                        loginVM.login()
                    }){
                      //NavigationLink(destination: MenuPrincipal()){
                        Text("login".uppercased())
                            .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.black))
                            .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white, buttonRadius: 10))
                      //}
                    }
                    .overlay(
                        NavigationLink(destination: MenuPrincipal(), isActive: $loginVM.isAuthenticated){
                            EmptyView()
                        }
                    )
                    .alert(isPresented: $loginVM.showLoginError){
                        Alert(title: Text("Datos Incorrectos"))
                    }
                    .padding(.horizontal,35)
                    .padding(.top,30)
                //}
                Spacer()
                //SighnUp
                VStack(spacing: 15){
                    Text("No tienes cuenta?")
                        .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.white.opacity(0.5)))
                    Button(action: {}){
                        NavigationLink(destination: RegistroUser().environmentObject(UserViewModel())){
                        Text("Registrarse".uppercased())
                            .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.white))
                            .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white.opacity(0.15), buttonRadius: 10))
                      }
                    }
                }
                .padding(.horizontal,90)
                .padding(.bottom,30)
                    
            }//VStack
          }//ZStack
      }//NavigationView
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct ButtonStyle: ViewModifier {
    //MARK:- PROPERTIES
    let buttonHeight: CGFloat
    let buttonColor: Color
    let buttonRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: buttonHeight)
            .background(buttonColor)
            .cornerRadius(buttonRadius)
    }
}

struct CustomTextM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color

    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}
