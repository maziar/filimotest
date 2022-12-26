//
//  MovieListViewController+Binding.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation

extension MovieListViewController {
    func setUpBinding() {
        bindMovieListViewModel()
    }
    
    func bindMovieListViewModel() {
        viewModel.movieListChangeHandler = { [weak self] change in
            guard let strongSelf = self else { return }
            switch change {
            case .didChangeNetworkActivityStatus(_):
                break
            case .didSuccess:
                strongSelf.tableView.cr.endHeaderRefresh()
                strongSelf.tableView.cr.endLoadingMore()
                if strongSelf.viewModel.listFinishedPages {
                    strongSelf.tableView.cr.noticeNoMoreData()
                } else {
                    strongSelf.tableView.cr.resetNoMore()
                }
                if strongSelf.viewModel.isNextPage() {
                    strongSelf.viewModel.movieList?.append(contentsOf: strongSelf.viewModel.movieListResponse?.results ?? [])
                }
                else {
                    strongSelf.viewModel.movieList = [MovieModel]()
                    strongSelf.viewModel.movieList = strongSelf.viewModel.movieListResponse?.results ?? []
                }
                strongSelf.tableView.reloadData()
            case .didError(let error):
                strongSelf.tableView.cr.endHeaderRefresh()
                strongSelf.tableView.cr.endLoadingMore()
                print(error)
            }
        }
    }
}
