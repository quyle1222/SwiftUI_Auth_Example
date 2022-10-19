//
//  Navigation.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import SwiftUI

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

struct Navigation {
    @State public var tabViewSelection = 1
    @State private var larger = true
    private var singleTabWidth = UIScreen.main.bounds.width / 2
    private var offset: CGFloat = 200.0
    @ObservedObject private var viewModel = NavigationViewModel()
}

extension Navigation: View {
    var body: some View {
        NavigationView {
            TabView(selection: $tabViewSelection) {
                HomeView().tabItem { Text("Tab Label 1") }.tag(1)
                Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
            }.onAppear {
                viewModel.goToLogin()
            }
            NavigationLink("", destination: AuthView(), isActive: $viewModel.isLogin)
        }
        .navigationBarHidden(true)
        
    }
}


extension Navigation {
}
