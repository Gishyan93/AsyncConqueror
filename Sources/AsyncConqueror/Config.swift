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

public protocol Config {
    var isNeedsAuth: Bool { get }
    var encodingType: EncodingType { get }
    var header: [String: String]? { get }
    var body: Encodable? { get }
}

extension Config {
    var isNeedsAuth: Bool { false }
    var encodingType: EncodingType { .json }
    var header: [String: String]? { nil }
    var body: Encodable? { nil }
}
