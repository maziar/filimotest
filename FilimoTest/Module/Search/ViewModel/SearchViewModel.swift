//
//  SearchViewModel.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import UIKit

final class SearchViewModel: BaseViewModel,
                             MovieListable {
    var movieListService: MovieListServiceProtocol!
    var movieListResponse: MovieListResponse?
    var movieListChangeHandler: ((MovieListModelChange) -> Void)?
    
    var searchText: String = "" {
        didSet {
            !searchText.isEmpty ?
            movieList(request: MovieListRequest(query: searchText)) :
            movieList(request: MovieListRequest())
            if !searchText.isEmpty { UserDefaults.standard.set(searchText, forKey: Key.recentSearch.rawValue) }
        }
    }
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    init(movieListService: MovieListServiceProtocol = MovieListService()) {
        self.movieListService = movieListService
    }
    
    func getResponse(isSearching: Bool) -> (response: Any?, length: Int) {
        (movieListResponse, movieListResponse?.results?.count ?? .zero)
    }
    
    func getItem(isSearching: Bool, index: Int) -> Any? {
        movieListResponse?.results?.item(at: index)
    }
}
