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
        MoviesRepostitory().getListMoviesTrending { [weak self] data in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if data.success {
                    guard let listMovies = data.data?.results, listMovies.count != 0 else {return}
                    self.listMovies = listMovies
                } else {
                    self.listMovies = []
                }
            }
        } fail: { error in
            guard error != nil else {return}
        }
    }
}
