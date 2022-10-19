//
//  HomeViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import Foundation

class HomeViewModel : ObservableObject {
    private var countApper:Int = 1
    @Published var title:String = "Default title"
    @Published var listItem = [Item]()
    
    init() {
        listItem = []
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setTitle(){
        countApper += 1
        self.title = "Count apper \(countApper)"
    }
    
    func getList()-> [Item]? {
        return listItem
    }
}
