//
//  ResizableLottieView.swift
//  swiftui-custom-tabbar-animation
//
//  Created by MM on 7/10/2565 BE.
//

import SwiftUI
import Lottie

struct ResizableLottieView: UIViewRepresentable {
    var lottieView: AnimationView
    var color: SwiftUI.Color = .black
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView {
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            let fillKeyPath = AnimationKeypath(keys: ["**", "Fill 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
//            lottieView.logHierarchyKeypaths()
            
            let strokeKeyPath = AnimationKeypath(keys: ["**", "Stroke 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
        }
    }
    
    func addLottieView(to: UIView) {
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor, constant: 15),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor, constant: 15)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
        
    }
}
