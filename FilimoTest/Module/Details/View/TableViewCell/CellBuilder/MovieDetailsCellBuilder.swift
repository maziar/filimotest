//
//  MovieDetailsCellBuilder.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import UIKit

enum MovieDetailsCellType {
    case image
    case overview
}

class MovieDetailsCellBuilder {
    func build(type: MovieDetailsCellType, tableView: UITableView, indexPath: IndexPath) -> BaseMovieDetailCell {
        var cell: BaseMovieDetailCell!
        
        switch type {
        case .image:
            cell = tableView.dequeueReusableCell(withIdentifier: MovieImageTableViewCell.nameOfClass,
                                                 for: indexPath) as? MovieImageTableViewCell
        case .overview:
            cell = tableView.dequeueReusableCell(withIdentifier: MovieDescriptionTableViewCell.nameOfClass,
                                                 for: indexPath) as? MovieDescriptionTableViewCell
        }
        return cell
    }
}
