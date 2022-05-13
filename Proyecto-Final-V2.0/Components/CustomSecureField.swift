//
//  CustomSecureField.swift
//  Proyecto-Final-V2.0
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct CustomSecureField: View {
    //MARK:- PROPERTIES
    var placeholder: Text
    var fontName: String
    var fontSize: CGFloat
    var fontColor: Color

    @Binding var password: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if password.isEmpty { placeholder.modifier(CustomTextM(fontName: fontName, fontSize: fontSize, fontColor: fontColor)) }
            SecureField("", text: $password, onCommit: commit)
                .foregroundColor(.white)
        }
    }
}
