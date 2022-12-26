//
//  MoviePresenter.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation

struct MoviePresenter {
    var title: String
    var posterPath: String
    var posterPath_200: String
    var posterPath_500: String
    var posterPath_original: String
    var releaseDate: String
    var overview: String
    
    init(item: MovieModel) {
        self.title = "\(item.title ?? String()) "
        self.posterPath = item.posterPath ?? String()
        self.posterPath_200 = "\(IMAGE_PREFIX)/w200\(item.posterPath ?? String())"
        self.posterPath_500 = "\(IMAGE_PREFIX)/w500\(item.posterPath ?? String())"
        self.posterPath_original = "\(IMAGE_PREFIX)/original\(item.posterPath ?? String())"
        self.releaseDate = item.releaseDate ?? String()
        self.overview = item.overview ?? String()
    }
    
    func posterSize(posterSize size: Int) -> String {
        return "\(IMAGE_PREFIX)/w\(size)\(self.posterPath)"
    }
}
