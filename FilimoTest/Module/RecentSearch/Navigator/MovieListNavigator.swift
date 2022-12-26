//
//  MovieListNavigator.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

class MovieListNavigator: Navigator {
    enum Destination {
        case movieDetails
    }
    
    private weak var navigationController: UINavigationController?
    private let viewControllerFactory: MovieListNavigatorProtocol
    
    init(navigationController: UINavigationController?,
         viewControllerFactory: MovieListNavigatorProtocol = MovieListDependencyContainer()) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func navigate(to destination: Destination,
                  isPresent: Bool = false,
                  modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                  animated: Bool = true,
                  viewModel: BaseViewModel? = nil,
                  isModalInPresentation: Bool = false) {
        let viewController = makeViewController(for: destination, viewModel: viewModel)
        
        if isPresent {
            viewController.isModalInPresentation = isModalInPresentation
            viewController.modalPresentationStyle = modalPresentationStyle
            navigationController?.present(viewController, animated: animated, completion: nil)
        } else {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func makeViewController(for destination: Destination,
                                    viewModel: BaseViewModel? = nil) -> UIViewController {
        switch destination {
        case .movieDetails:
            if let viewmodel = viewModel as? MovieDetailsViewModel {
                return viewControllerFactory.makeMovieDetailsViewController(viewModel: viewmodel)
            }
            return UIViewController()
        }
    }
}
