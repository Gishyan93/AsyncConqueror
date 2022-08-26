//
//  File.swift
//  
//
//  Created by Tigran Gishyan on 26.08.22.
//

import Foundation

class FormDataEncoder {
    func encode(
        with params: [String: String]?,
        media: [UploadFile]?,
        boundary: String
    ) throws -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        if let media = media {
            for file in media {
                body.append("--\(boundary + lineBreak)")
                body.append(
                    "Content-Disposition: form-data; name=\"\(file.id)\";filename=\"\(file.name)\"\(lineBreak)"
                )
                body.append("Content-Type: \(file.mimeType + lineBreak + lineBreak)")
                body.append(file.data)
                body.append(lineBreak)
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
}
