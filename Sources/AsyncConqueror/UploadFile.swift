//
//  File 2.swift
//  
//
//  Created by Tigran Gishyan on 26.08.22.
//

import Foundation

struct UploadFile: Encodable {
    var id: String
    var name: String
    var mimeType: String
    var data: Data
}
