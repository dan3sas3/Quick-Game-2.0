//
//  LoginViewModel.swift
//  Proyecto-Final-V2.0
//
//  Created by Jose Emiliano Parra on 15/05/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var showLoginError: Bool = false
    
    func login(){
        let defaults = UserDefaults.standard
        
        LoginService().login(email: email, password: password){result in
            switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async{
                        self.isAuthenticated = true
                        self.showLoginError = false
                    }
                case .failure(let error):
                    DispatchQueue.main.async{
                        self.showLoginError = true
                    }
                    print(error.localizedDescription)
            }
        }
    }
    
    func signout(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
