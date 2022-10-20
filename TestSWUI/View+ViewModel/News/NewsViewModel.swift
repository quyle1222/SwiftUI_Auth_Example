//
//  NewsViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation

struct AlertMessage {
    var title:String
    var message:String
}

class NewsViewModel: ObservableObject {
    @Published var isShowAlert:Bool = false
    @Published var alertMessage : AlertMessage?
    
    func showAlert(){
        alertMessage = AlertMessage(title: "Error", message: "Check show modal")
        self.isShowAlert = true
    }
}
