//
//  Coordinator.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

class Coordinator: NSObject, UIScrollViewDelegate  {
    var parent : Carousel
        init(parent1: Carousel) {
            parent = parent1
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        self.parent.page = page
    }
}
