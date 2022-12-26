//
//  MovieDetailsViewController.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MovieDetailsViewModel!
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: MovieDetailsViewController.nameOfClass, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}
