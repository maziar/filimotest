//
//  MovieListResponse.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import ObjectMapper

public struct MovieListResponse: Mappable {
    public var pagination: Pagination!
    public var results: [MovieModel]!
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        self.pagination = Pagination(JSON: map.JSON)
        self.results <- map["results"]
    }
}
