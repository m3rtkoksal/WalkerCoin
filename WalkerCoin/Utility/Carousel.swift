//
//  Carousel.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 26.10.2020.
//

import SwiftUI

struct Carousel: UIViewRepresentable {
    var width: CGFloat
    @Binding var page: Int
    var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(Service.data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        view.addSubview(view1.view)
        return view
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(width: 250, page: .constant(1), height: UIScreen.main.bounds.height)
    }
}
