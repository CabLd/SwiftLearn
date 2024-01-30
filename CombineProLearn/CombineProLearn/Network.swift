//
//  Network.swift
//  CombineProLearn
//
//  Created by yangtz on 2024/1/30.
//

import Foundation
import Combine
//                     some??
func fetchMovies() -> some Publisher<MovieResponse, Error> {
    let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!

    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data) // map?? \.data??
        .decode(type: MovieResponse.self, decoder: jsonDecode)
}
