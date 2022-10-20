//
//  MoviesTrendingOutput.swift
//  TestSWUI
//
//  Created by TuPT on 20/10/2022.
//

import Foundation
struct MoviesTrendingOutput: Codable {
    var success: Bool
    var message:String?
    var errorCode:String?
    var data: MoviesTrendingData?
}

struct MoviesTrendingData : Codable {
    var page: Int
    var result: [MovieTrending]?
}

struct MovieTrending: Codable{
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var title: String
    var release_date: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}
