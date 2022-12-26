//
//  MovieDetailsViewController+TableView.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

extension MovieDetailsViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        MovieImageTableViewCell.register(for: tableView)
        MovieDescriptionTableViewCell.register(for: tableView)
    }
}

extension MovieDetailsViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = MovieDetailsCellBuilder()
        let item = viewModel.items[indexPath.row]
        let tableCell = tableCellBuilder.build(type: item.type,
                                               tableView: tableView,
                                               indexPath: indexPath)
        tableCell.config(movie: viewModel.movie)
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.items[indexPath.row]
        return item.size
    }
}
