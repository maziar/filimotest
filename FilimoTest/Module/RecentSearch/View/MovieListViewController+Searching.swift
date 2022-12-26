//
//  MovieListViewController+Searching.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

extension MovieListViewController {
    func setupSearchViewController() {
        searchViewController = SearchViewController(nibName: SearchViewController.nameOfClass, bundle: nil)
        searchViewController.delegate = self
        searchController = UISearchController(searchResultsController: searchViewController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Label.search.rawValue
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.delegate = self
        searchController.searchBar.tintColor = .gray
        searchController.showsSearchResultsController = true
        searchController.isActive = true
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.searchTextField.isFirstResponder {
            searchController.showsSearchResultsController = true
            let color = ColorPalette.searchBackGroundColor
            searchController.searchBar.searchTextField.backgroundColor = color
        } else {
            searchController.searchBar.searchTextField.backgroundColor = nil
            searchViewController.viewModel.searchText = String()
            searchViewController.tableView.reloadData()
        }
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewController.viewModel.searchText = searchText
    }
}

extension MovieListViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            self.searchController.searchResultsController?.view.isHidden = false
        }
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.searchController.searchResultsController?.view.isHidden = false
    }
}

extension MovieListViewController: SearchDelegate {
    func didSelect(movie: MovieModel) {
        navigator.navigate(to: .movieDetails, viewModel: MovieDetailsViewModel(movie: movie))
    }
}
