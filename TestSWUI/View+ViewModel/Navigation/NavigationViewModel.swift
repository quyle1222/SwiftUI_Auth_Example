//
//  NavigationViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
class NavigationViewModel : ObservableObject {
    @Published var isLogin : Bool = false
    @Published var isHidden : Bool = false
    @Published var isPick:Bool = false

    func setPickImage(isPick : Bool){
        self.isHidden = isPick
    }
    
    func goToLogin () {
        self.isLogin = true
    }

}
