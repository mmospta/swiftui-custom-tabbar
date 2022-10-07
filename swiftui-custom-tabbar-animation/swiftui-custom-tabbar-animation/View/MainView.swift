//
//  MainView.swift
//  swiftui-custom-tabbar-animation
//
//  Created by MM on 7/10/2565 BE.
//

import SwiftUI
import Lottie

struct MainView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: Tab = .home
    @State var animatedIcon: [AnimatedIcon] = {
        var tabs: [AnimatedIcon] = []
        for tab in Tab.allCases {
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue)))
        }
        return tabs
    }()
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                Text("Home")
                    .setBG()
                    .tag(Tab.home)
                
                Text("Account")
                    .setBG()
                    .tag(Tab.account)
                
                Text("Banking")
                    .setBG()
                    .tag(Tab.banking)
                
                Text("Notification")
                    .setBG()
                    .tag(Tab.notification)
                
                Text("More")
                    .setBG()
                    .tag(Tab.more)
            }
            
            if #available(iOS 16.0, *) {
                TabBar().toolbar(.hidden, for: .tabBar)
            } else {
                TabBar()
            }
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
                ForEach(animatedIcon) { icon in
                    let tabColor: SwiftUI.Color = currentTab == icon.tabIcon ? (scheme == .dark ? .white : .black) : .gray.opacity(0.6)
                    VStack(spacing: 2) {
                        ResizableLottieView(lottieView: icon.lottieView, color: tabColor)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                currentTab = icon.tabIcon
                                icon.lottieView.play { _ in
                                    
                                }
                        }
                        
                        if  currentTab == icon.tabIcon {
                            Text("•")
                                .font(.system(size: 16))
                        }
                    }
                }
                
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background {
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    @ViewBuilder
    func setBG() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color.primary.opacity(0.05)
                    .ignoresSafeArea()
            }
    }
}
