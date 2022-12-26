//
//  MovieListService.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import Alamofire

public class MovieListService: BaseService, MovieListServiceProtocol {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    public func getMovieList(request: MovieListRequest,
                             _ completion: @escaping (Result<MovieListResponse>) -> Void) {
        let urlString = createApiRoute(route: MOVIE_SEARCH_ROUTE)
        AF.request(urlString,
                   method: .get,
                   parameters: request.dictionary,
                   encoding: URLEncoding.default,
                   headers: header)
        .validate(statusCode: 200..<300)
        .responseData { (response) in
            switch response.result {
            case .success(let data):
                let result = MovieListSerializer.shared.serialize(data: data)
                completion(result)
            case .failure(let error):
                let errorModel = self.checkErrorMessage(response, error: error)
                let result = Result<MovieListResponse>.failure(errorModel)
                completion(result)
            }
        }
    }
}
