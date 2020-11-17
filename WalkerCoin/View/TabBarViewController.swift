//
//  TabBarViewController.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 5.11.2020.
//

import SwiftUI

struct TabBarViewController: View {
    @State private var selection = 3
    var body: some View {
        ZStack {
            TabView(selection:$selection) {
                OffersView()
                    .tabItem ({
                        Image(systemName: "bag").renderingMode(.template)
                        Text("Offers")
                    })
                    .tag(1)
                BalanceView()
                    .tabItem ({
                        Image(systemName: "creditcard").renderingMode(.template)
                        Text("Balance")
                    })
                    .tag(2)
                StepView()
                    .tabItem ({
                        Image(systemName: "figure.walk.circle").renderingMode(.template)
                        Text("Steps")
                    })
                    .tag(3)
                FriendsView()
                    .tabItem {
                        Image(systemName: "person.2")
                        Text("Friends")
                    }
                    .tag(4)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(5)
                
            }
            .accentColor(Color("ColorOnboarding"))
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarViewController_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewController()
    }
}
