//
//  Question.swift
//  DevPrep
//
//  Created by Andy Couto on 11/26/22.
//

import Foundation
import SwiftUI

enum QuestionType: String, CaseIterable, Codable
{
    case all = "All"
    case behavioral = "Behavioral"
    case accessibility = "Accessibility"
    case architecture = "Architecture"
    case dataParsing = "Data Parsing"
    case appleFrameworks = "Apple Frameworks"
    case designPatterns = "Design Patterns"
    case uiKit = "UIKit"
    case swiftUI = "SwiftUI"
    case testing = "Testing"
    case objectiveC = "Objective-C"
    case xCode = "Xcode"
    case performance = "Performance"
    case security = "Security"
    case swift = "Swift"
    case dataPersistence = "Data Persistence"
    case networking = "Networking"
    case tooling = "Tooling"
    
    var icon: Image
    {
        switch self
        {
        case .behavioral:
            return Image(systemName: "person.fill")
        case .accessibility:
            return Image("accessibility")
        case .architecture:
            return Image(systemName: "building.columns")
        case .dataParsing:
            return Image(systemName: "pencil")
        case .appleFrameworks:
            return Image(systemName: "suitcase.fill")
        case .designPatterns:
            return Image(systemName: "paintpalette.fill")
        case .uiKit:
            return Image(systemName: "paintbrush.pointed.fill")
        case .swiftUI:
            return Image(systemName: "swift")
        case .testing:
            return Image(systemName: "testtube.2")
        case .objectiveC:
            return Image(systemName: "apple.logo")
        case .xCode:
            return Image(systemName: "hammer.fill")
        case .performance:
            // externaldrive.fill.trianglebadge.exclamationmark
            return Image(systemName: "chart.line.uptrend.xyaxis")
        case .security:
            return Image(systemName: "touchid")
        case .swift:
            return Image(systemName: "swift")
        case .dataPersistence:
            return Image(systemName: "laptopcomputer.and.arrow.down")
        case .networking:
            return Image(systemName: "network")
        case .tooling:
            return Image(systemName: "pencil.and.ruler")
        case .all:
            return Image(systemName: "magazine")
        }
    }
    
    // TODO: Color
}

struct Question: Identifiable, Hashable, Codable
{
    let id: Int
    let type: QuestionType
    let ask: String
    let answer: String
    
    var userAdded = false
}
