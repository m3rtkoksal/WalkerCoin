//
//  PageControl.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct PageControl: UIViewRepresentable {

    @Binding var page : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .white
        view.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.2)
        view.numberOfPages = Service.data.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(page: .constant(4))
    }
}
