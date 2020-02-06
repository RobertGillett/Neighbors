//
//  VideoDownloadInfo.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//
import Foundation

struct VideoDownloadInfo: Codable {
    
    let byteCount: Int
    let spendTime: TimeInterval
    let startTime: Date
    
    var speed: Double {
        Double(byteCount) / 1024 / spendTime
    }
    
    init(byteCount: Int, spendTime: TimeInterval, startTime: Date) {
        self.byteCount = byteCount
        self.spendTime = spendTime
        self.startTime = startTime
    }
}
