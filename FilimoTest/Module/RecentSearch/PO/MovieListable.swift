//
//  MovieListable.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation

enum MovieListModelChange {
    case didSuccess
    case didError(Error)
    case didChangeNetworkActivityStatus(Bool)
}

protocol MovieListable: AnyObject {
    var movieListService: MovieListServiceProtocol! { get }
    var movieListResponse: MovieListResponse? { get set }
    var movieListChangeHandler: ((MovieListModelChange) -> Void)? { get set }
    func movieList(request: MovieListRequest)
}

extension MovieListable {
    func movieList(request: MovieListRequest) {
        emitMovieList(.didChangeNetworkActivityStatus(true))
        movieListService.getMovieList(request: request) { [weak self](result) in
            guard let strongSelf = self else { return }
            strongSelf.emitMovieList(.didChangeNetworkActivityStatus(false))
            switch result {
            case .success(let response):
                strongSelf.movieListResponse = response
                strongSelf.emitMovieList(.didSuccess)
            case .failure(let error):
                strongSelf.emitMovieList(.didError(error))
            }
        }
    }
    
    func emitMovieList(_ change: MovieListModelChange) {
        movieListChangeHandler?(change)
    }
}
