//
//  OnboardingView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct OnboardingView: View {
    @State var page = 0
    @State var isContinue : Bool = false
    @EnvironmentObject var settingsWM : SettingsViewModel
    var body: some View {
            ZStack {
                Color("ColorOnboarding").edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Walker")
                        Image("logo")
                        Text("App")
                    }
                    .font(Font.custom("SFCompactDisplay-Bold", size: 16))
                    .foregroundColor(.white)
                    GeometryReader { g in
                        Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                    }
                    
                    Button(action: {
                        self.isContinue.toggle()
                    }) {
                        Text("Devam Et")
                            .foregroundColor(.black)
                            .padding(.vertical,25)
                            .padding(.horizontal,UIScreen.main.bounds.width / 3)
                    }
                    .background(Color("ColorWelcome"))
                    .clipShape(Capsule())
                    .padding(.top,20)
                    PageControl(page: self.$page)
                        .padding(.top,20)
                        .foregroundColor(.white)
                        .fullScreenCover(isPresented: $isContinue, content: {
                            WelcomeView()
                        })
                }
                .padding(.vertical)
                
            }
           
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
