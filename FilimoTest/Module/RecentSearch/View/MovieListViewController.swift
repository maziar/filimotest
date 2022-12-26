//
//  MovieListViewController.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    var searchViewController: SearchViewController!
    var viewModel = MovieListViewModel()
    lazy var navigator = MovieListNavigator(navigationController: self.navigationController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchViewController()
        setUpBinding()
        setup()
        viewModel.listRequest()
    }
    
    func setup() {
        viewModel.pullToRefreshDelegate = self
    }
}
