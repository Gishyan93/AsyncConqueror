//
//  File.swift
//  
//
//  Created by Tigran Gishyan on 27.08.22.
//

import Foundation

@available(iOS 13.0.0, *)
public protocol Networkable {
    func sendRequest<T: Decodable>(with config: Config) async throws -> T
    func authorizedRequest<T: Identifiable>(with config: Config) async throws -> T
}
