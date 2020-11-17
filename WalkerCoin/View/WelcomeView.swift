//
//  WelcomeView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct WelcomeView: View {
    @State var isLogin : Bool = false
    @State var isRegister : Bool = false
    var body: some View {
        NavigationView {
            VStack {
            ZStack(alignment: .top) {
                Image("Welcomebg")
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                Image("WelcomeImage")
                    .padding(.vertical, 30)
                HStack {
                    Text("Walker")
                    Image("logo")
                    Text("App")
                }
                .font(Font.custom("SFCompactDisplay-Bold", size: 16))
                .foregroundColor(.black)
            }
                Spacer()
                Text("Title")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 30))
                Text("Description")
                    .font(Font.custom("SFCompactDisplay", size: 16))
                    .foregroundColor(.gray)
                    .padding(.vertical, 20)
                Spacer()
                NavigationLink("", destination: LoginView(), isActive: $isLogin)
                Button(action: {
                    self.isLogin.toggle()
                }) {
                    Text("GIRIS YAP")
                        .foregroundColor(.white)
                        .padding(.vertical,25)
                        .padding(.horizontal,UIScreen.main.bounds.width / 3)
                        .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                }
                .background(Color("ColorOnboarding"))
                .clipShape(Capsule())
                .padding(.top,20)
                HStack {
                    Text("HESABINIZ YOK MU?")
                        .foregroundColor(.gray)
                    NavigationLink("", destination: SignupView(), isActive: $isRegister)
                    Button(action: {
                        self.isRegister.toggle()
                    }) {
                        Text("UYE OL")
                            .foregroundColor(Color("ColorOnboarding"))
                            .padding(.vertical,25)
                    }
                }
                .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .navigationBarHidden(true)
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
