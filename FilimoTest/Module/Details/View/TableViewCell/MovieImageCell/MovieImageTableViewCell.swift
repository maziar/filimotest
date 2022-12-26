//
//  MovieImageTableViewCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit
import SDWebImage

class MovieImageTableViewCell: BaseMovieDetailCell {
    @IBOutlet weak var posterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(movie: MovieModel) {
        let presenter = MoviePresenter(item: movie)
        posterImageView.sd_setImage(with: URL(string: presenter.posterPath_original),
                                    placeholderImage: UIImage(named: Image.placeholder.rawValue))
    }
}

extension MovieImageTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: MovieImageTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: MovieImageTableViewCell.nameOfClass)
    }
}
