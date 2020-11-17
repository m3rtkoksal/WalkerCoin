//
//  Card.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct Card: View {
    @Binding var page: Int
    var data: OnboardingDetailElement
    
    var width: CGFloat
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.5568627451, green: 0.5921568627, blue: 0.9921568627, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Text(self.data.title)
                    .font(Font.custom("SFCompactDisplay", size: 30))
                    .foregroundColor(Color("OnboardingColor"))
                    .padding(.top, 20)
                    .foregroundColor(.white)
                Spacer()
                Text(self.data.subtitle)
                    .font(Font.custom("SFCompactDisplay", size: 16))
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                Image(self.data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color("OnboardingColor"))
                Spacer(minLength: 0)
                Spacer(minLength: 0)
            }
            .padding()
            .frame(width: self.width)
            .animation(.default)
        
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(page: .constant(1), data: OnboardingDetailElement(image: "OnboardingImageOne", title: "title", subtitle: "subtitle"), width: UIScreen.main.bounds.width)
    }
}
