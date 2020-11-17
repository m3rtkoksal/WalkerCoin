//
//  FriendsView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 5.11.2020.
//

import SwiftUI

struct FriendsView: View {
    @State var index = 3
    var body: some View {
        VStack {
            Text("friends")
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
