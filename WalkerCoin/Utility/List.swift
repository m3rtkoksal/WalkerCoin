//
//  List.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct List: View {
    @Binding var page: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Service.data) { i in
                Card(page: self.$page, data: i, width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        List(page: .constant(1))
    }
}
