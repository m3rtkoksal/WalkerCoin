//
//  SignupView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 27.10.2020.
//

import SwiftUI
import Combine

struct SignupView: View {
    @State var isFacebook: Bool = false
    @State var isGoogle: Bool = false
    @State var isLogin: Bool = false
    @State private var showingAlert = false
    @State var isValidisValidEmail: Bool = false
    @State var isValidisValidPassword: Bool = false
    @State private(set) var emailAddress = ""
    @State private(set) var nameSurnameCheckmark = ""
    @State private(set) var emailCheckmark = ""
    @State private(set) var password = ""
    @State private(set) var nameSurname = ""
    @State private(set) var successAlert = false
    @State private var checked: Bool = false
    @State var isValidisNameSurname: Bool = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
//            NavigationView {
                VStack {
                    ZStack {
                        Image("Signinbg")
                            .resizable()
                            //                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("Hesap Olustur")
                                .font(Font.custom("SFCompactDisplay-Bold", size: 28))
                                .foregroundColor(.black)
                            Button(action: {
                                self.isFacebook.toggle()
                            }) {
                                HStack{
                                    Image("facebook")
                                        .renderingMode(.original)
                                        .padding(.horizontal, -70)
                                    Text("FACEBOOK ILE DEVAM ET")
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
                                    Text("GOOGLE ILE DEVAM ET")
                                        .foregroundColor(.black)
                                        .font(Font.custom("SFCompactDisplay", size: 14))
                                }
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60, alignment: .center)
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
                            .padding(.vertical, 20)
                        CustomTextField(data: $nameSurname, tFtext: "Isim Soyad", tFImage: nameSurnameCheckmark)
                            .padding(.horizontal, 6)
                            .textContentType(.givenName)
                            .onReceive(Just(nameSurname)) { nameSurnameData in
                                if nameSurname.count > 10 {
                                    self.isValidisNameSurname.toggle()
                                    nameSurnameCheckmark = "checkmark"
                                }
                            }
                        CustomTextField(data: $emailAddress, tFtext: "Email adresi", tFImage: emailCheckmark)
                            .padding(.horizontal, 10)
                            .textContentType(.emailAddress)
                            .onReceive(Just(emailAddress)) { emailAddressData in
                                if emailAddress.count > 10 {
                                    self.isValidisValidEmail.toggle()
                                    emailCheckmark = "checkmark"
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
                        HStack {
                            Text("Gizlilik Kosullarini Okudum")
                            Spacer()
                            CheckBoxView(checked: $checked)
                        }
                        .padding(.horizontal)
                    }
                    NavigationLink("", destination: TabBarViewController(), isActive: $isLogin)
                        .navigationBarBackButtonHidden(true)
                    Button(action: {
                        if !isValidisValidEmail || !isValidisNameSurname || !checked {
                            self.showingAlert = true
                        } else {
                            self.showingAlert = false
                            self.successAlert = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.successAlert = false    // hide popup
                                self.isLogin.toggle()
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
