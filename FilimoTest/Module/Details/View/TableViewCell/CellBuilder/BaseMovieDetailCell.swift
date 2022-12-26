//
//  BaseMovieDetailCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import UIKit

protocol BaseMovieDetailCellProtocol {
    func config(movie: MovieModel)
}

class BaseMovieDetailCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(movie: MovieModel) {}
}
