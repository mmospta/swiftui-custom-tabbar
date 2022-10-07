//
//  AnimatedIcon.swift
//  swiftui-custom-tabbar-animation
//
//  Created by MM on 7/10/2565 BE.
//

import SwiftUI
import Lottie

struct AnimatedIcon: Identifiable {
    var id = UUID().uuidString
    var tabIcon: Tab
    var lottieView: AnimationView
}
