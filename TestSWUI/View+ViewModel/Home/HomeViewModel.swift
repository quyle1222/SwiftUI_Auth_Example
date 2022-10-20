//
//  HomeViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    private var countApper:Int = 1
    @Published var title:String = "Default title"
    @Published var listItem = [Item]()
    @Published var listMovies:[MovieTrending] = [MovieTrending]()
    
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
    
    func getListMovieTrending(){
        DispatchQueue.main.async {
            MoviesRepostitory().getListMoviesTrending { [weak self] data in
                if data.success {
                    let list = data.data?.result ?? [MovieTrending]()
                    
                }
            } fail: { error in
                guard error != nil else {return}
            }
        }
    }
}
