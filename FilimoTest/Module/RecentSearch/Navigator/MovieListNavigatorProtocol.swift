//
//  MovieListNavigatorProtocol.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

protocol MovieListNavigatorProtocol {
    func makeMovieDetailsViewController(viewModel: MovieDetailsViewModel) -> MovieDetailsViewController
}
