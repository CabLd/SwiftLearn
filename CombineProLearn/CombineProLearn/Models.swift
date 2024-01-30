//
//  Models.swift
//  CombineProLearn
//
//  Created by yangtz on 2024/1/30.
//

import Foundation


let apiKey = "da9bc8815fb0fc31d5ef6b3da097a009"

let jsonDecode: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map { URL(string: "https://image.tmdb.org/t/p/w400\($0)")! }
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct MovieCastMember: Identifiable, Equatable, Decodable {
    let id: Int
    let name: String
    let character: String
}

struct MovieCreditResponse: Decodable {
    let cast: [MovieCastMember]
}

struct MovieReview: Identifiable, Equatable, Decodable {
    let id: String
    let author: String
    let content: String
}

struct MovieReviewResponse: Decodable {
    let results: [MovieReview]
}
