//
//  VideoCacheAction.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation

struct VideoCacheAction {
    
    enum ActionType {
        case local
        case remote
    }
    
    let actionType: ActionType
    let range: NSRange
    
}
