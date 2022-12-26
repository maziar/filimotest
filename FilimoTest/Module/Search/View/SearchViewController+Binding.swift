//
//  SearchViewController+Binding.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation

extension SearchViewController {
    func setUpBinding() {
        bindSearchViewModel()
    }
    
    func bindSearchViewModel() {
        viewModel.movieListChangeHandler = { [weak self] change in
            guard let strongSelf = self else { return }
            switch change {
            case .didChangeNetworkActivityStatus(_):
                break
            case .didSuccess:
                strongSelf.tableView.reloadData()
            case .didError(let error):
                print(error)
            }
        }
    }
    
}
