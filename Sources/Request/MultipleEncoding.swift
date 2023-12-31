//
//  MultipleEncoding.swift
//  NiuNiuRent
//
//  Created by 张泉 on 2023/4/19.
//

import Alamofire
import Foundation

public struct MultipleEncoding: ParameterEncoding {
    public init() {}
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var params = [String: Any]()
        if parameters != nil {
            params = parameters!
        }
//        params["timestamp"] = String(format: "%.0f", Date.init(timeIntervalSinceNow: 0).timeIntervalSince1970)
        let urlRequest = try urlRequest.asURLRequest()
        if urlRequest.httpMethod == "GET" {
            return try URLEncoding.default.encode(urlRequest, with: params)
        } else {
            return try JSONEncoding.default.encode(urlRequest, with: params)
        }
    }
}

public struct ReplaceQuestionMarkPostEncoding: ParameterEncoding {
    public init() {}
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try JSONEncoding().encode(urlRequest, with: parameters)
        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%3F", with: "?"))
        return request
    }
}

public struct ReplaceQuestionMarkGetEncoding: ParameterEncoding {
    public init() {}
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%3F", with: "?"))
        return request
    }
}
