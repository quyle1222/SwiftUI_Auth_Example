//
//  NavigationViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
class NavigationViewModel : ObservableObject {
    @Published var isLogin : Bool = false
    
    func goToLogin () {
        self.isLogin = true
    }

}
