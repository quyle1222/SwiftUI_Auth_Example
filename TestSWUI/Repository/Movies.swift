//
//  Movies.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
class MoviesRepostitory {
    private let netword = SessionNetwork()
    
    func getListMoviesTrending(success: @escaping(MoviesTrendingOutput)->Void, fail: @escaping (Error?)->Void) {
        netword.restAPI(url: "movies/listTrending", method: .get, data: nil) { response, urlResponse, error in
            guard error == nil && response != nil else {
                fail(error)
                return
            }
            do{
                let dataResponse = try JSONDecoder().decode(MoviesTrendingOutput.self,from: response!)
                success(dataResponse)
            } catch let doError {
                fail(doError)
            }
            
        }
    }
}
