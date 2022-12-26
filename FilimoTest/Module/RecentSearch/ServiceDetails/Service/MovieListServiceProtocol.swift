//
//  MovieListServiceProtocol.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation

public protocol MovieListServiceProtocol {
    func getMovieList(request: MovieListRequest,
                      _ completion: @escaping (Result<MovieListResponse>) -> Void)
}
