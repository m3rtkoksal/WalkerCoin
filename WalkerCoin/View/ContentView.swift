//
//  ContentView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settingsWM : SettingsViewModel
    var body: some View {
        ZStack {
            if settingsWM.login {
            TabBarViewController()
            } else {
                OnboardingView()
            }
        }
        .onAppear {
            settingsWM.login = UserDefaults.standard.bool(forKey: "login")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
