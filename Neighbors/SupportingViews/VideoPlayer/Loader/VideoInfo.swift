//
//  VideoInfo.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation

struct VideoInfo: Codable {
    
    var contentLength: Int
    var contentType: String
    var isByteRangeAccessSupported: Bool
    
    init(contentLength: Int, contentType: String, isByteRangeAccessSupported: Bool) {
        self.contentLength = contentLength
        self.contentType = contentType
        self.isByteRangeAccessSupported = isByteRangeAccessSupported
    }
    
}
