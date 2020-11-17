//
//  TabBar.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 5.11.2020.
//

import SwiftUI

struct TabBar: View {
    @Binding var index: Int
    var body: some View {
        HStack (spacing: 15){
            VStack{
                Image(systemName: "bag")
                    .resizable()
                    .frame(width: 35, height: 30)
                Text(self.index == 0 ? "Offers" : "")
                    .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .foregroundColor(self.index == 0 ? Color.white : Color(.lightGray))
            .padding(10)
            .background(self.index == 0 ? Color("ColorOnboarding") : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                self.index = 0
            }
            VStack{
                Image(systemName: "creditcard")
                    .resizable()
                    .frame(width: 35, height: 30)
                Text(self.index == 1 ? "Balance" : "")
                    .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .foregroundColor(self.index == 1 ? Color.white : Color(.lightGray))
            .padding(10)
            .background(self.index == 1 ? Color("ColorOnboarding") : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                self.index = 1
            }
            VStack{
                Image(systemName: "figure.walk.circle")
                    .resizable()
                    .frame(width: 35, height: 30)
                Text(self.index == 2 ? "Steps" : "")
                    .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .foregroundColor(self.index == 2 ? Color.white : Color(.lightGray))
            .padding(10)
            .background(self.index == 2 ? Color("ColorOnboarding") : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                self.index = 2
            }
            VStack{
                Image(systemName: "person.2")
                    .resizable()
                    .frame(width: 35, height: 30)
                Text(self.index == 3 ? "Friends" : "")
                    .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .foregroundColor(self.index == 3 ? Color.white : Color(.lightGray))
            .padding(10)
            .background(self.index == 3 ? Color("ColorOnboarding"): Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                self.index = 3
            }
            VStack{
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(self.index == 4 ? "Profile" : "")
                    .font(Font.custom("SFCompactDisplay", size: 14))
            }
            .foregroundColor(self.index == 4 ? Color.white : Color(.lightGray))
            .padding(10)
            .background(self.index == 4 ? Color("ColorOnboarding") : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                self.index = 4
            }
        }
        .padding(.top, 8)
        .frame(width: UIScreen.main.bounds.width)
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(index: .constant(0))
    }
}
