//
//  AppRouter.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

final class AppRouter {
    static let shared = AppRouter()
    
    func configureHomeViewController() -> UIViewController {
        let vc = MovieListViewController(nibName: MovieListViewController.nameOfClass, bundle: nil)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
}
