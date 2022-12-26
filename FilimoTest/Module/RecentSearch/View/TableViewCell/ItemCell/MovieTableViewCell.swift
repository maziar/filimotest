//
//  MovieTableViewCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit
import UIView_Shimmer
import MarqueeLabel

class MovieTableViewCell: BaseSearchCell, ShimmeringViewProtocol {
    @IBOutlet weak var shimmerTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: MarqueeLabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var shimmeringAnimatedItems: [UIView] {
        [
            shimmerTitleLabel,
            releaseDateLabel,
            movieImageView
        ]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        showShimmer(show: true)
    }
    
    func setupUI() {
        movieImageView.setCurvedView(cornerRadius: SizeConstant.imageRadius.rawValue)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(movie: MovieModel) {
        let presenter = MoviePresenter(item: movie)
        titleLabel.text = presenter.title
        movieImageView.sd_setImage(with: URL(string: presenter.posterPath_200),
                                   placeholderImage: UIImage(named: Image.placeholder.rawValue))
        releaseDateLabel.text = presenter.releaseDate
        self.showShimmer(show: false)
    }
}

extension MovieTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: MovieTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: MovieTableViewCell.nameOfClass)
    }
}


