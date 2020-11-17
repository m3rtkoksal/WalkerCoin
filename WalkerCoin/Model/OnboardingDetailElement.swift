//
//  OnboardingDetails.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import Foundation

struct OnboardingDetailElement : Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var subtitle: String
    
    init(image: String, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}
