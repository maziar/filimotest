//
//  MovieDescriptionTableViewCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit

class MovieDescriptionTableViewCell: BaseMovieDetailCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(movie: MovieModel) {
        let presenter = MoviePresenter(item: movie)
        descriptionLabel.text = presenter.overview
    }
}

extension MovieDescriptionTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: MovieDescriptionTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: MovieDescriptionTableViewCell.nameOfClass)
    }
}
