//
//  File.swift
//  
//
//  Created by Tigran Gishyan on 25.08.22.
//

import Foundation

public enum EncodingType {
    case url
    case json
    case multipart(params: [String: String]?)
}

public struct Config {
    var isNeedsAuth: Bool
    var isAllowedRetry: Bool
    var encodingType: EncodingType
    var headers: [String: String]?
    var body: Encodable?
    
    public init(
        isNeedsAuth: Bool,
        isAllowedRetry: Bool = false,
        encodingType: EncodingType = .json,
        headers: [String: String]? = nil,
        body: Encodable? = nil
    ) {
        self.isNeedsAuth = isNeedsAuth
        self.isAllowedRetry = isAllowedRetry
        self.encodingType = .json
        self.headers = headers
        self.body = body
    }
}
