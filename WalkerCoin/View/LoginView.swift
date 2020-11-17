//
//  LoginView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 27.10.2020.
//

import SwiftUI
import Combine
struct LoginView: View {
    @State var isFacebook: Bool = false
    @State var isGoogle: Bool = false
    @State var isValidisValidEmail: Bool = false
    @State var isValidisValidPassword: Bool = false
    @State var isForget: Bool = false
    @State var isRegister : Bool = false
    @State var isTyping : Bool = false
    @State private var showingAlert = false
    @State private(set) var successAlert = false
    @State private(set) var emailAddress = ""
    @State private(set) var password = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var settingsWM : SettingsViewModel
    var body: some View {
        ZStack {
//            NavigationView {
                VStack {
                    ZStack {
                        Image("Signinbg")
                            .resizable()
                            //                        .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("Hosgeldin")
                                .font(Font.custom("SFCompactDisplay-Bold", size: 28))
                                .foregroundColor(.black)
                            Button(action: {
                                self.isFacebook.toggle()
                            }) {
                                HStack{
                                    Image("facebook")
                                        .renderingMode(.original)
                                        .padding(.horizontal, -70)
                                    Text("FACEBOOK ILE GIRIS YAP")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFCompactDisplay", size: 14))
                                }
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60, alignment: .center)
                                .overlay(RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.black, lineWidth: 0.5))
                                .background(Color("ColorFB"))
                            }
                            .cornerRadius(30)
                            Button(action: {
                                self.isGoogle.toggle()
                                
                            }) {
                                HStack{
                                    Image("google")
                                        .renderingMode(.original)
                                        .padding(.horizontal, -85)
                                    Text("GOOGLE ILE GIRIS YAP")
                                        .foregroundColor(.black)
                                        .font(Font.custom("SFCompactDisplay", size: 14))
                                }
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .overlay(RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.black, lineWidth: 0.5))
                                .background(Color(.white))
                            }
                            .cornerRadius(30)
                        }
                    }
                    VStack {
                        Text("VEYA EMAIL ILE GIRIS YAP")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                            .foregroundColor(.gray)
                        CustomTextField(data: $emailAddress, tFtext: "Email adresi")
                            .padding(.horizontal, 10)
                            .textContentType(.emailAddress)
                            .onReceive(Just(emailAddress)) { emailAddressData in
                                if emailAddress.count > 10 {
                                    self.isValidisValidEmail.toggle()
                                }
                            }
                        SecureField("Sifre", text: $password)
                            .padding()
                            .font(Font.custom("SFCompactDisplay", size: 16))
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
                            .frame(height: 58)
                            .padding(.horizontal, 10)
                        NavigationLink("", destination: TabBarViewController(), isActive: $settingsWM.login)
                        Button(action: {
                            if !isValidisValidEmail {
                                self.showingAlert = true
                            } else {
                                self.showingAlert = false
                                self.successAlert = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.successAlert = false    // hide popup
                                    self.settingsWM.login = true
                                    UserDefaults.standard.set(true, forKey: "login")
                                }
                            }
                        }) {
                            Text("GIRIS YAP")
                                .foregroundColor(.white)
                                .padding(.vertical,25)
                                .padding(.horizontal,UIScreen.main.bounds.width / 3)
                                .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Uye bilgileri hatali"), message: Text("Tekrar Kontrol Edin"), dismissButton: .default(Text("OK")))
                        }
                        .background(Color("ColorOnboarding"))
                        .clipShape(Capsule())
                        .padding(.top,20)
                        
                        Button(action: {
                            self.isForget.toggle()
                        }) {
                            Text("SIFREMI UNUTTUM")
                                .foregroundColor(Color(.black))
                                .padding(.vertical,25)
                                .font(Font.custom("SFCompactDisplay", size: 14))
                        }
                        Spacer(minLength: 30)
                        HStack {
                            Text("HESABINIZ YOK MU?")
                                .foregroundColor(.gray)
                            NavigationLink("", destination: SignupView(), isActive: $isRegister)
                                .navigationBarBackButtonHidden(true)
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
                }
//            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image("backbutton")
                    .foregroundColor(.black)
            })
            SuccessCardView(isShown: $successAlert)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
