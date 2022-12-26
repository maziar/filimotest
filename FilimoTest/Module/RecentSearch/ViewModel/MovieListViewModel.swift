//
//  MovieListViewModel.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

final class MovieListViewModel: BaseViewModel,
                                MovieListable {
    var movieListService: MovieListServiceProtocol!
    var movieListResponse: MovieListResponse?
    var movieListChangeHandler: ((MovieListModelChange) -> Void)?
    var current: Int?
    var request: MovieListRequest?
    var movieList: [MovieModel]?
    
    init(movieListService: MovieListServiceProtocol = MovieListService()) {
        self.movieListService = movieListService
    }
}
