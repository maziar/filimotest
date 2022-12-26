//
//  MovieDetailsViewModel.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

final class MovieDetailsViewModel: BaseViewModel {
    var movie: MovieModel!
    var items = [
        MovieDetailsCellItem(
            size: SizeConstant.movieDetailsImageTableCellHeight.rawValue,
            type: .image),
        MovieDetailsCellItem(
            size: UITableView.automaticDimension,
            type: .overview)
    ]
    
    init(movie: MovieModel) {
        self.movie = movie
    }
}

struct MovieDetailsCellItem {
    var size: CGFloat!
    var type: MovieDetailsCellType!
    
    init(size: CGFloat,
         type: MovieDetailsCellType) {
        self.size = size
        self.type = type
    }
}

