//
//  ServiceRoutesConstants.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation


let SERVER_URL = "https://api.themoviedb.org"
let IMAGE_PREFIX = "https://image.tmdb.org/t/p"
let API_KEY = "7f7576002b9cdebe2691023699fdfba0"


let MOVIE_SEARCH_ROUTE = "https://api.themoviedb.org/3/search/movie"
let MOVIE_ROUTE = "https://api.themoviedb.org/3/movie/{slug}"

func createApiRoute(route: String, slug: String = String()) -> String {
    let route = slug.isEmpty ? route : route.replacingOccurrences(of: "{slug}",
                                                                  with: slug)
    return route
}
