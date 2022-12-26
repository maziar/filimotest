//
//  MovieModel.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import ObjectMapper

public struct MovieModel: Mappable {
    public var adult: Bool!
    public var backdropPath: String!
    public var genreIds: [Int]!
    public var id: Int!
    public var originalLanguage: String?
    public var originalTitle: String?
    public var overview: String?
    public var popularity: Float!
    public var posterPath: String?
    public var releaseDate: String?
    public var title: String!
    public var video: Bool!
    public var voteAverage: Float!
    public var voteCount: Int!
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        self.adult <- map["adult"]
        self.backdropPath <- map["backdrop_path"]
        self.genreIds <- map["genre_ids"]
        self.id <- map["id"]
        self.originalLanguage <- map["original_language"]
        self.originalTitle <- map["originalTitle"]
        self.overview <- map["overview"]
        self.popularity <- map["popularity"]
        self.posterPath <- map["poster_path"]
        self.releaseDate <- map["release_date"]
        self.title <- map["title"]
        self.voteAverage <- map["vote_average"]
        self.voteCount <- map["vote_count"]
    }
}
