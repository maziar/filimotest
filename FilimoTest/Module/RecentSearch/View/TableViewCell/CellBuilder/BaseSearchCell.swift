//
//  BaseSearchCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

protocol BaseSearchCellProtocol {
    func config(movie: MovieModel)
}

class BaseSearchCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(movie: MovieModel) {}
}
