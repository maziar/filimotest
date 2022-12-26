//
//  MovieListViewController+TableView.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit
import CRRefresh

extension MovieListViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        MovieTableViewCell.register(for: tableView)
        
        tableView.cr.addHeadRefresh(animator: PullToRefreshAnimator()) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.movieList = nil
            strongSelf.viewModel.listRequest()
        }
        
        tableView.cr.addFootRefresh(animator: PullUpAddAnimator()) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.listRequest(next: true)
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let movie = viewModel.movieList?.item(at: indexPath.row) else {
            return
        }
        let movieDeatilsViewModel = MovieDetailsViewModel(movie: movie)
        navigator.navigate(to: .movieDetails, viewModel: movieDeatilsViewModel)
    }
}

extension MovieListViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList?.count ?? 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = SearchCellBuilder()
        let tableCell = tableCellBuilder.build(type: .defaults,
                                               tableView: tableView,
                                               indexPath: indexPath)
        if let movie = viewModel.movieList?.item(at: indexPath.row) {
            tableCell.config(movie: movie)
        }
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeConstant.searchTableCellHeight.rawValue
    }
}

extension MovieListViewController: PullToRefreshDelegate {
    func finish() {
        DispatchQueue.main.async { [self] in
            tableView.cr.endHeaderRefresh()
            tableView.cr.endLoadingMore()
            if viewModel.listFinishedPages {
                tableView.cr.noticeNoMoreData()
            } else {
                tableView.cr.resetNoMore()
            }
        }
    }
}
