//
//  AVAssetResourceLoadingRequest+Extensions.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import AVFoundation

extension AVAssetResourceLoadingRequest {
    
    var url: URL? {
        let prefix = AVPlayerItem.loaderPrefix
        
        guard
            let urlString = request.url?.absoluteString,
            urlString.hasPrefix(prefix)
            else { return nil }
        
        return urlString.replacingOccurrences(of: prefix, with: "").url
    }
    
}
