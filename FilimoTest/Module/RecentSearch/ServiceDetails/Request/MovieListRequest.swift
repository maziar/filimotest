//
//  MovieListRequest.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation

public struct MovieListRequest {
    public var itemsPerPage: Int = 30
    public var page: Int = 1
    public var query: String = UserDefaults.standard.string(forKey: Key.recentSearch.rawValue) ?? "GodFather"
    public var time = Date()
    public var apiKey = API_KEY
    
    var dictionary: [String: Any] {
        return ["page": page,
                "api_key": apiKey,
                "query": query]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
