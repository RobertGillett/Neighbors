//
//  Incident.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import CoreLocation


struct Incident: Identifiable {
    var id: String = UUID().uuidString
    var author: String
    var title: String
    var body: String
    var type: IncidentType
    var mediaType: MediaType
    var date: Date
    var coordinates: CLLocationCoordinate2D
    
    var likers: [String] = []
    var comments : [IncidentComment] = []
    
    var shareUrl: String
    
    var commentCount: Int {
        return comments.count
    }
    var likesCount: Int {
        return likers.count
    }
    
}

struct IncidentComment: Identifiable {
    var id: String = UUID().uuidString
    var body: String
    var userId: String
    var date: Date
}
