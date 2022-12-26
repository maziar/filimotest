//
//  SearchCellBuilder.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

enum SearchCellType {
    case defaults
    case result
}

class SearchCellBuilder {
    func build(type: SearchCellType, tableView: UITableView, indexPath: IndexPath) -> BaseSearchCell {
        var cell: BaseSearchCell!
        switch type {
        case .defaults:
            cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.nameOfClass,
                                                 for: indexPath) as? MovieTableViewCell
        case .result:
            cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.nameOfClass,
                                                 for: indexPath) as? SearchResultTableViewCell
        }
        return cell
    }
}
