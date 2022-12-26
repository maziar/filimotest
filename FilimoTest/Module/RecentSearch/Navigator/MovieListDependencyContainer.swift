//
//  MovieListDependencyContainer.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

class MovieListDependencyContainer: MovieListNavigatorProtocol {
    func makeMovieDetailsViewController(viewModel: MovieDetailsViewModel) -> MovieDetailsViewController {
        MovieDetailsViewController(viewModel: viewModel)
    }
}
