//
//  ProfileView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 5.11.2020.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settingsWM : SettingsViewModel
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                UserDefaults.standard.set(false, forKey: "login")
                settingsWM.login = false
            }) {
                Text("Çıkış Yap")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
