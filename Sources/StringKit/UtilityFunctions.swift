//
//  UtilityFunctions.swift
//  StringKit
//
//  Created by Rick Street on 10/23/25.
//

/// Create full description for tags
/// - Parameters:
///   - name: Tag Name
///   - description: Tag Desdription
///   - units: tag engineering limits
/// - Returns: description with name, description, and units
func fullTagDescription(name: String, description: String, units: String) -> String {
    var string = ""
    if name.isEmpty {
        string = description
    } else {
        if description.isEmpty {
            string = name
        } else {
            string = "\(name), \(description)"
        }
    }
    if !units.isEmpty {
        string += ", \(units)"
    }
    return string
}

/// Short tag description
/// - Parameters:
///   - name: Tag Name
///   - Description: Tag Description
/// - Returns: tag name or dexcription of there is no name
func shortTagDescription(name: String, Description: String) -> String {
    if !name.isEmpty {
        return name
    } else {
        return Description
    }
}

// Force Change

