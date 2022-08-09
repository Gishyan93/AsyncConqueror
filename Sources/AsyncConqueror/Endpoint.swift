//
//  Endpoint.swift
//  FoxApp
//
//  Created by Tigran Gishyan on 24.07.22.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
