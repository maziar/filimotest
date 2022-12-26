//
//  SearchViewController.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import UIKit

protocol SearchDelegate: AnyObject {
    func didSelect(movie: MovieModel)
}

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = SearchViewModel()
    weak var delegate: SearchDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setUpBinding()
    }
}
