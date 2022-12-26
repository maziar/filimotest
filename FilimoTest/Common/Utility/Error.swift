//
//  Error.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import ObjectMapper

public struct ErrorModel: Mappable {
    public var message: String!
    public var statusCode: Int?
    
    public init?(map: Map) {}
    
    public init(message: String, statusCode: Int?) {
        self.message = message
        self.statusCode = statusCode
    }
    
    mutating public func mapping(map: Map) {
        self.message <- map["message"]
        self.statusCode <- map["status_code"]
    }
}

extension ErrorModel {
    func toNSError() -> NSError {
        let nserror = NSError(domain: self.message , code: self.statusCode ?? 0014, userInfo: nil)
        return nserror
    }
}
