//
//  ColorExtension.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 6.11.2020.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red : r / 255, green: g / 255 , blue: b / 255)
    }
    static let trackProgressBarColor = Color.rgb(r:246,g:141,b:95)
    static let progressBarColor = Color.rgb(r: 230, g: 230, b: 230)
}
