//
//  Pagination.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import ObjectMapper

public struct Pagination: Mappable {
    public var totalPages: Int!
    public var totalItems: Int!
    public var page: Int!
    public var itemsPerPage: Int = 20
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        self.totalPages <- map["total_pages"]
        self.totalItems <- map["total_results"]
        self.page <- map["page"]
    }
}
