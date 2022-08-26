//
//  File.swift
//  
//
//  Created by Tigran Gishyan on 26.08.22.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
