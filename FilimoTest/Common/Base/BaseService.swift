//
//  BaseService.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import Alamofire
import AdSupport
import SwiftyJSON

public class BaseService {
    var header: HTTPHeaders {
        return HTTPHeaders(headers)
    }
    
    var headers = [
        "accept": "application/json",
        "Content-Type": "application/json",
        "Accepts-version": "1.0",
        "Cache-Control": "no-cache",
        "PLATFORM": "ios",
        "OS-Version": UIDevice.current.systemVersion,
        "Device-Type": UIDevice.current.model,
        "Device-Name": UIDevice.current.name,
        "App-Version": "",
        "Apn-Token": "",
        "Fcm-Token": "",
        "Bundle-Id": Bundle.main.bundleIdentifier ?? "",
        "Authorization": "Bearer \("Mybearer")"
    ]
    
    func checkErrorMessage(_ response: AFDataResponse<Data>, error: Error) -> Error {
        if let data = response.data,
           let message = SwiftyJSON.JSON(data)["message"].rawValue as? String,
           !message.isEmpty {
           let error = ErrorModel(message: message, statusCode: response.response?.statusCode)
            return error.toNSError()
        }
        return NSError(domain: error.localizedDescription, code: response.response?.statusCode ?? 14, userInfo: nil)
    }
}
