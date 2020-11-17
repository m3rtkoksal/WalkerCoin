//
//  CircularProgress.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 6.11.2020.
//

import SwiftUI

struct CircularProgress: View {
    var steps: Int
    var body: some View {
            VStack {
                ZStack {
                    Track()
                    Label(steps: steps)
                    Outline(steps: steps)
                }
            }
    }
}

struct Label: View {
    var steps: Int
    var body : some View {
        ZStack {
            VStack {
                Text(String(steps))
                    .font(Font.custom("SFCompactDisplay-Bold", size: 56))
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                Text("adim")
                    .font(Font.custom("SFCompactDisplay", size: 26))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Outline: View {
    var steps: Int
    var percentage: CGFloat = 15000
    var colors : [Color] = [Color.trackProgressBarColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .trim(from: 0, to: CGFloat(steps) / percentage )
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                        .rotationEffect(Angle(degrees: 270.0))
                ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color.progressBarColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress(steps: 3000)
    }
}
