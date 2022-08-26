//
//  File.swift
//  
//
//  Created by Tigran Gishyan on 26.08.22.
//

import Foundation

@available(iOS 10.0, *)
extension Encodable {
    func convertToJSON(with dateStrategy: JSONEncoder.DateEncodingStrategy = .iso8601) -> Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = dateStrategy
        return try? encoder.encode(self)
    }
    
    func convertToMultiPart(
        boundary: String,
        params: [String: String]? = nil
    ) -> Data? {
        try? FormDataEncoder().encode(
            with: params,
            media: self as? [UploadFile],
            boundary: boundary
        )
    }
}
