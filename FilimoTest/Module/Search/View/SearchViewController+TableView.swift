//
//  SearchViewController+TableView.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import UIKit

extension SearchViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        SearchResultTableViewCell.register(for: tableView)
    }
}

extension SearchViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let movie = viewModel.movieListResponse?.results.item(at: indexPath.row) else {
            return
        }
        delegate?.didSelect(movie: movie)
    }
}

extension SearchViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getResponse(isSearching: viewModel.isSearching).length
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = SearchCellBuilder()
        guard let movie = viewModel.movieListResponse?.results.item(at: indexPath.row) else {
            return UITableViewCell()
        }
        let tableCell = tableCellBuilder.build(type: .result,
                                               tableView: tableView,
                                               indexPath: indexPath)
        tableCell.config(movie: movie)
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  SizeConstant.searchTableCellHeight.rawValue
    }
}
