//
//  CustomTextField.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 27.10.2020.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var data : String
    var tFtext: String = ""
    var tFImage: String = ""
    var body: some View {
        HStack {
            ZStack {
                TextField(tFtext, text: $data)
                    .padding()
                    .font(Font.custom("SFCompactDisplay", size: 16))
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
                    .frame(height: 58)
                HStack{
                    Spacer()
                Image(systemName:tFImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(.green)
                }
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(data: .constant(""), tFtext: "Email Adresi",tFImage: "checkmark")
    }
}
