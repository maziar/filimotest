//
//  MovieListViewModel+Pagination.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/26/22.
//

import Foundation

extension MovieListViewModel {
    var listCurrentPage: Int {
        return current ?? 1
    }
    
    var listEndPage: Int {
        if let total = self.movieListResponse?.pagination.totalItems,
           let limit = self.movieListResponse?.pagination.itemsPerPage {
            let maxPage = total / limit
            return Int(ceil(Float(maxPage)))
        }
        return 1
    }
    
    var listPageSize: Int {
        var page = (movieList?.count ?? .zero) / IntSize.pageSize.rawValue
        if page == .zero { page = 1 }
        return Int(ceil(Float(page)))
    }
    
    var listFinishedPages: Bool {
        return self.listCurrentPage >= self.listEndPage
    }
    
    var movieListCurrentPage: Int {
        return self.movieListResponse?.pagination.page ?? 1
    }
    
    func isNextPage() -> Bool {
        return listCurrentPage > listPageSize
    }
    
    func listRequest(next: Bool = false) {
        var request = MovieListRequest()
        var page = 1
        if next {
            if let currentPage = current {
                page = currentPage + 1
            }
        }
        current = page
        request.page = page
        request.itemsPerPage = self.movieListResponse?.pagination.itemsPerPage ?? IntSize.pageSize.rawValue
        if checkRepeatRequest(lastdate: self.request?.time) {
            DispatchQueue.main.async {
                self.pullToRefreshDelegate?.finish()
            }
            return
        }
        self.request = request
        DispatchQueue.main.async {
            self.movieList(request: request)
        }
    }
}
