//
//  File.swift
//  
//
//  Created by Rick Street on 6/22/21.
//

import Foundation

public extension Array where Element == String {
    
    
    /// Wildcard Search of String Array
    /// - Parameter pattern: ? can match to any single character in the input string and * can match to any number of characters including zero characters
    /// - Returns: String Array with wild card matches
    func wildcard(pattern: String) -> [String] {
        var returnArray: [String] = []
        
        for item in self {
            if (wildcard(item, pattern: pattern)) {
                returnArray.append(item)
            }
        }
        
        return returnArray
    }
    
    // Credit to Martin R @ SO for this brilliance: https://stackoverflow.com/a/57271935/215950
    private func wildcard(_ string: String, pattern: String) -> Bool {
        let pred = NSPredicate(format: "self LIKE %@", pattern)
        return !NSArray(object: string).filtered(using: pred).isEmpty
    }
}
