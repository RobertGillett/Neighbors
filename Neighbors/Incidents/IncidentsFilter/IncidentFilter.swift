//
//  IncidentFilter.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import UIKit

struct IncidentFilter: Hashable, Identifiable {
    var title: String
    var image: UIImage?
    var color: UIColor
    var field: String
    var fieldValue: String
    var badgeValue: String = ""
    
    public var id: String {
        return self.fieldValue
    }
    static func == (lhs: IncidentFilter, rhs: IncidentFilter) -> Bool {
        return lhs.id == rhs.id && lhs.badgeValue == rhs.badgeValue && lhs.title == rhs.title
    }
}
