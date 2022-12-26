//
//  SearchResultTableViewCell.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import UIKit
import MarqueeLabel

class SearchResultTableViewCell: BaseSearchCell {
    @IBOutlet weak var shimmerTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: MarqueeLabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        showShimmer(show: true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupUI() {
        movieImageView.setCurvedView(cornerRadius: SizeConstant.imageRadius.rawValue)
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

extension SearchResultTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: SearchResultTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: SearchResultTableViewCell.nameOfClass)
    }
}
