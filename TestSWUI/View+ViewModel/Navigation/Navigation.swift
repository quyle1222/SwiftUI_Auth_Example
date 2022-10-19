//
//  Navigation.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import SwiftUI
import DSSwiftUIKit

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

struct Navigation {
    @ObservedObject private var viewModel = NavigationViewModel()
    @State public var tabViewSelection = 1
    @State private var larger = true
  
    private var singleTabWidth = UIScreen.main.bounds.width / 2
    private var offset: CGFloat = 200.0
}

extension Navigation: View {
    var body: some View {
        ZStack{
            NavigationView {
                TabView(selection: $tabViewSelection) {
                    HomeView(setHiddenTabBar:setHiddenTabbar)
                        .tabItem { Text("Tab Label 1").hidden(if: viewModel.isHidden) }
                        .tag(1)
                    Text("Tab Content 2")
                        .tabItem {Text("Tab Label 2").hidden(if: viewModel.isHidden) }
                        .tag(2)
                }.onAppear {
                    viewModel.goToLogin()
                }
                NavigationLink("", destination: AuthView(), isActive: $viewModel.isLogin)
            }
            .navigationBarHidden(true)
                FilePicker(documentTypes: ["*.png","*.jpg"]) {
                    viewModel.setPickImage(isPick: false)
                } resultAction: { fileResult in
                    viewModel.setPickImage(isPick: true)
                }
                .zIndex(99).hidden(if: !viewModel.isHidden)
        }
    }
}


extension Navigation {
    
    func setHiddenTabbar(isHidden:Bool){
        viewModel.isHidden = isHidden
    }
}
