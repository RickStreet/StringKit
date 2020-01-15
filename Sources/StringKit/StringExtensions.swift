//
//  StringExtensions.swift
//  StringKit
//
//  Created by Rick Street on 10/20/16.
//  Copyright © 2020 Rick Street. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     Determines if string contains another string
     
     - Parameters:
        - target:    String to find
     
     - returns: True if string found
     */
    func contains(target: String) -> Bool
    {
        return self.range(of: target) != nil
    }
    
    /// stringToFind must be at least 1 character.
    func countInstances(of stringToFind: String) -> Int {
        assert(!stringToFind.isEmpty)
        var count = 0
        var searchRange: Range<String.Index>?
        while let foundRange = range(of: stringToFind, options: [], range: searchRange) {
            count += 1
            searchRange = Range(uncheckedBounds: (lower: foundRange.upperBound, upper: endIndex))
        }
        return count
    }
    
    /**
     Determines starting index of a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: starting String index of substring (optional)
     */
    func indexOf(_ target: String) -> String.Index?
    {
        return self.range(of: target)?.lowerBound
    }


    /**
     Determines index before a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: starting String index of substring (optional)
     */
    func indexBefore(_ target: String) -> String.Index?
    {
        return self.range(of: target)?.lowerBound.advance(by: -1, for: self)
    }
    
    /**
     Determines index after a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: starting String index of substring (optional)
     */
    func indexAfter(_ target: String) -> String.Index?
    {
        return self.range(of: target)?.upperBound
    }
    

    
    /**
     Determines ending index of a string in another string starting from the right
     
     - Parameters:
        - target:    String to find
     
     - returns: ending String index of substring (optional) fron right
     */
    func reverseIndexOf(_ target: String) -> String.Index?
    {
        let index = self.range(of: target, options:NSString.CompareOptions.backwards)?.upperBound.advance(by: -1, for: self)
        return index
    }
    
    /**
     Determines ending index of a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: ending index of substring (optional)
     */
    
    func lastIndexOf(_ target: String) -> String.Index?
    {
        return self.range(of: target)?.upperBound
    }
    
    /**
     Returns String with occurances of a substing replaced by another
     
     - Parameters:
        - _:       Substring to replace
        - with:    replacement substring
     
     - returns: String with substring replaced
     */
    func replace(_ of: String, with: String) -> String
    {
        return self.replacingOccurrences(of: of, with: with)
    }
     
    /**
     Gives String from index <Int>
     
     - Parameters:
        - from:    index for start of substring
     
     - returns: substring from index to end
     */
    func substring(from: Int) -> String {
        if from < self.count - 1 {
            let start = self.index(self.startIndex, offsetBy: from)
            // let end = self.endIndex
            return String(self[start...])
        }
        return ""
    }
    
    /**
     Gives String to index <Int>
     
     - Parameters:
        - to:    index for start of substring
     
     - returns: substring to index
     */
    func substring(to: Int) -> String {
        if to < self.count {
            let end = self.index(self.startIndex, offsetBy: to)
            // let end = self.endIndex
            return String(self[...end])
        } else {
            return self
        }
    }
    
    
    /**
     - Parameters:
        - _: Index for first char of substring
     
     - returns:  substring starting at i through the rest of the string
     */
    func right(_ i: Int) -> String {
        if i < self.count {
            let fromEnd = self.index(self.endIndex, offsetBy: -i)
            return String(self[fromEnd...])
        } else {
            return ""
        }
    }
    
    /**
     Gives a Array of Strings for each word in quotes
     - Parameters:
        - string: string to parse
     
     - returns: array of strings. Each string is word delinated my quotes
     */
    func quotedWords() -> [String] {
        var word = ""
        var words = [String]()
        var firstQuote = false
        for char in self {
            if char == "\"" {
                if firstQuote {
                    firstQuote = false
                    words.append(word)
                    word = ""
                } else {
                    firstQuote = true
                }
            } else {
                if firstQuote {
                    word.append(char)
                }
            }
        }
        return words
    }
    
    
    /**
     Returns String starting from left to index
     - Parameters:
     - _: Index for first char of substring
     
     - returns:  substring starting at i through the rest of the string
     */
    func left(_ i: Int) -> String {
        if i < self.count {
            let end = self.index(self.startIndex, offsetBy: i)

            return String(self[..<end])
        } else {
            return ""
        }
        
    }

    /**
     Returns substring for Int range
     - Parameters:
        - with: intiger range
     
     - returns:  substring with int range
     */
    func substring(with: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: with.lowerBound)
        let end = self.index(self.startIndex, offsetBy: with.upperBound)
        // return self.substring(with: start..<end)
        return String(self[start ..< end])
    }
    
    
    /**
     Trims whitespace characters from ends of a string
     
     - Parameters:
        - none:
     
     returns:    String with whitespace characters removed form both ends
     */
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    /**
     Trims punctuation characters from ends of a string
     
     - Parameters:
        - none:
     
     returns:    String with whitespace characters removed form both ends
     */
    func trimPunctuation() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.punctuationCharacters)
    }
    
    /**
     Pads the string from the left
     - parameters:
        - toLength:  final length of string
        - withPad:  padding string
     returns:    String with padding on left
     */
    func leftPadding(toLength: Int, withPad: String = " ") -> String {
        
        guard toLength > self.count else { return self }
        
        let padding = String(repeating: withPad, count: toLength - self.count)
        return padding + self
    }
    
    /**
     Returns base of file name from path
     returns:    String before "."
     */
    func fileBase() -> String? {
        if let index = self.lastIndexOf(".") {
            return String(self[..<index.advance(by: -1, for: self)])
        }
        return nil
    }
    
    
    /**
     Returns base of file name from path with no -nnm version
     returns:    String before "-" if present or before "." if present or self
     */
    func fileBaseNoVersion() -> String{
        if let i = self.indexBefore("-") {
            // return file.substring(to: i)
            return String(self[...i])
        }
        if let i = self.indexBefore(".") {
            // return file.substring(to: i)
            return String(self[...i])
        }
        return self
    }

    
    /// Returns file extension
    func fileExtension() -> String? {
        if let index = self.lastIndexOf(".") {
            return String(self[index...])
        }
        return nil
    }
    
    /// Returns base capitalized and extension lowecased
    func fileCapitalized() -> String {
        if let base = self.fileBase(), let ext = self.fileExtension() {
            return base.capitalized + "." + ext.lowercased()
        }
        return self.capitalized
    }

    /**
     Pads string with spaces to right
     - parameters:
        - toLength: final length of string
        - returns:
     String with spaces padded on the right
     */
    func padding(toLength: Int) -> String {
        return self.padding(toLength: toLength, withPad: " ", startingAt: 0)
    }

    
    /**
     Double value for a string
     */
    var doubleValue: Double? {
        return Double(self.trim())
    }
    
    /**
     Float value for a string
     */
    var floatValue: Float? {
        return Float(self.trim())
    }
    
    /**
     Int value for a string
     */
    var integerValue: Int? {
        return Int(self.trim())
    }
    
    /**
     Is String is a number
     */
    var isNumber: Bool {
        if self.trim().doubleValue != nil {
            return true
        } else {
            return false
        }
    }
    
    /**
     Date value for a string
     */
    var dateValue: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        if let date = formatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }

    /**
     Date value for a string
     */
    func dateValue(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }

    
    /**
     Array of vowels
     */
    private var vowels: [String]
        {
        get
        {
            return ["a", "e", "i", "o", "u"]
        }
    }
    
    /**
     Array of consonants
     */
    private var consonants: [String]
        {
        get
        {
            return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
        }
    }
    
}

extension String.Index{
    
    /**
     Next Index in a Range
     */
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    /**
     Previous Index in a Range
     */
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    /**
     Advance index by a number
     */
    func advance(by offset: Int, for string: String) -> String.Index {
        return string.index(self, offsetBy: offset)
    }
}