//
//  IncidentType.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import UIKit

enum IncidentType: String, CaseIterable, Identifiable {
    public var id: String {
        return self.rawValue
    }
    case LostPet = "Lost Pet"
    case Suspicious
    case Safety
    case Crime
    case UnknownVisitor = "Unknown Visitor"
    
    var color: UIColor {
        switch self {
        case .LostPet:
            return .systemBlue
        case .Suspicious:
            return .systemPurple
        case .Safety:
            return .systemGreen
        case .Crime:
            return .systemRed
        case .UnknownVisitor:
            return .systemYellow
        }
    }
    var description: String {
        switch self {
        case .LostPet:
            return "Missing and found pet family members"
        case .Suspicious:
            return "Attempted criminal activity or unusual behavior that is cause for concern"
        case .Safety:
            return "Discussion of potentially dangerous incidents or activity"
        case .Crime:
            return "Criminal activity involving theft, damage, illegal entry, or violence"
        case .UnknownVisitor:
            return "An unknown person with questionable intent who is on your property"
        }
    }
}

enum CrimeType: String {
    case Homicide, Shooting, Assault, Robbery, Theft, Vandalism, Arrest, Drugs, Kidnapping
}
