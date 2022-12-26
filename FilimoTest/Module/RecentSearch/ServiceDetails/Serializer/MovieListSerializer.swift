//
//  MovieListSerializer.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import ObjectMapper

class MovieListSerializer {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    static let shared = MovieListSerializer()
    
    func serialize(data: Data) -> Result<MovieListResponse> {
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        guard let json = json else {
            let result = Result<MovieListResponse>.failure(Error.invalidResponse)
            return result
        }
        guard let response = MovieListResponse(JSON: json) else {
            let result = Result<MovieListResponse>.failure(Error.invalidResponse)
            return result
        }
        return Result<MovieListResponse>.success(response)
    }
}
