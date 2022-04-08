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
    func index(of target: String) -> String.Index?
    {
        return self.range(of: target)?.lowerBound
    }
 
    /**
     Determines index before a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: starting String index of substring (optional)
     */
    func index(before target: String) -> String.Index?
    {
        return self.range(of: target)?.lowerBound.advance(by: -1, for: self)
    }

        
    /**
     Determines index after a string in another string
     
     - Parameters:
        - target:    String to find
     
     - returns: starting String index of substring (optional)
     */
    func index(after target: String) -> String.Index?
    {
        return self.range(of: target)?.upperBound
    }
    
    /**
     Determines ending index of a string in another string starting from the right
     
     - Parameters:
        - target:    String to find
     
     - returns: ending String index of substring (optional) fron right
     */
    func index(afterLast target: String) -> String.Index?
    {
        let index = self.range(of: target, options:NSString.CompareOptions.backwards)?.upperBound
        return index
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
 
    
    /// Cleans Contract Label (Address Book)
    /// - Returns: String stripped of "_$!<"  and ">!$_"
    func contactLabel() -> String {
        let label = self.replacingOccurrences(of: "_$!<", with: "")
        return label.replacingOccurrences(of: ">!$_", with: "")
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
     Returns String starting from left to index
     - Parameters:
     - _: Index for first char of substring
     
     - returns:  substring starting at i through the rest of the string
     */
    func left(_ i: Int) -> String {
        if i <= self.count {
            let end = self.index(self.startIndex, offsetBy: i)

            return String(self[..<end])
        } else {
            return self
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
     Returns substring for integer range
     - Parameters:
        - with: interger range
     
     - returns:  string with integer  range
     */
    func substring(with: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: with.lowerBound)
        let end = self.index(self.startIndex, offsetBy: with.upperBound)
        // return self.substring(with: start..<end)
        return String(self[start ..< end])
    }
    
    /// Returns substring for Int range
    /// - Parameter with: integer range
    /// - Returns: String? with integer range
    func substringOptional(with: Range<Int>) -> String? {
        if self.isEmpty || with.lowerBound < 0 || with.upperBound > self.count {
            return nil
        }
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
    
    /// Removes singe and double quotes from string
    /// - Returns: stipped string
    func trimQuotes() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "\"\'"))
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
    
    func padding(leftTo paddedLength:Int, withPad pad:String=" ", startingAt padStart:Int=0) -> String {
       let rightPadded = self.padding(toLength:max(count,paddedLength), withPad:pad, startingAt:padStart)
       return "".padding(toLength:paddedLength, withPad:rightPadded, startingAt:count % paddedLength)
    }
    
    /**
     Returns base of file name from path
     returns:    String before "."
     */
    func fileBase() -> String? {
        if let index = self.index(afterLast: ".") {
            return String(self[..<index.advance(by: -1, for: self)])
        }
        return nil
    }

    
    /**
     Returns base of file name from path with no -nnm version
     returns:    String before "-" if present or before "." if present or self
     */
    func fileBaseNoVersion() -> String {
        if let base = self.fileBase() {
            if let index = base.index(afterLast: "-") {
                return String(base[...index.advance(by: -2, for: base)])
            } else {
                return base
            }
        }
        return self
    }

    
    /// Returns file extension
    func fileExtension() -> String? {
        if let index = self.index(afterLast: ".") {
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

    var numbersStripped: String {
        self.filter("_abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ".contains)
    }
    
    
    var charactersStripped: String {
        self.filter("0123456789".contains)
    }

    
    var phoneNumbersOnly: String {
        self.filter("0123456789".contains)
    }
    
    var phoneNumberFormatted: String? {
        // check if international
        if self.count < 6 {
            return nil
        }
        if self.left(3) == "011" {
            return self
        }
        
        if self.left(1) == "+" {
            // Has country code
            let components = self.components(separatedBy: " ")
            print(components)
        }

        
        // Remove any character that is not a number
        // let numbersOnly = sourcePhoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let numbersOnly = self.phoneNumbersOnly
        let length = numbersOnly.count
        let hasLeadingOne = numbersOnly.hasPrefix("1")

        if self.left(1) == "+" {
            // Has country code
            if self.contains(target: " ") {
                let components = self.components(separatedBy: " ")
                if components[0] != "+1" {
                    return self
                }
            }
            if self.contains(target: ".") {
                let components = self.components(separatedBy: ".")
                if components[0] != "+1" {
                    return self
                }
            }
            
            if self.contains(target: "-") {
                let components = self.components(separatedBy: "-")
                if components[0] != "+1" {
                    return self
                }
            }
        }

        let hasAreaCode = (length >= 10)
        var sourceIndex = 0

        // Leading 1
        var leadingOne = ""
        if hasLeadingOne {
            leadingOne = "1 "
            sourceIndex += 1
        }

        // Area code
        var areaCode = ""
        if hasAreaCode {
            let areaCodeLength = 3
            let testAreaCode = numbersOnly.substringOptional(with: sourceIndex ..< sourceIndex + areaCodeLength)
            print("area code \(testAreaCode ?? "")")
            guard let areaCodeSubstring = numbersOnly.substringOptional(with: sourceIndex..<areaCodeLength) else {
                return nil
            }
            areaCode = String(format: "(%@) ", areaCodeSubstring)
            sourceIndex += areaCodeLength
        }

        // Prefix, 3 characters
        let prefixLength = 3
        let testPrefix = numbersOnly.substringOptional(with: sourceIndex ..< sourceIndex + prefixLength)
        print("prefix \(testPrefix ?? "")")
        guard let prefix = numbersOnly.substringOptional(with: sourceIndex ..< sourceIndex + prefixLength) else {
            return nil
        }
        sourceIndex += prefixLength

        // Suffix, 4 characters
        let suffixLength = 4
        let testsuffix = numbersOnly.substringOptional(with: sourceIndex ..< sourceIndex + suffixLength)
        print("suffix \(testsuffix ?? "")")
        guard let suffix = numbersOnly.substringOptional(with: sourceIndex ..< sourceIndex + suffixLength) else {
            return nil
        }
        return leadingOne + areaCode + prefix + "-" + suffix
    }
    


    
    /**
     Double value for a string
     */
    var doubleValue: Double? {
        return Double(self.filter("-+0123456789.eE".contains))
        // return Double(self.trim())
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
    var vowels: [String]
        {
        get
        {
            return ["a", "e", "i", "o", "u"]
        }
    }
    
    /**
     Array of consonants
     */
    var consonants: [String]
        {
        get
        {
            return ["a", "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z",
                    "A", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z"]
        }
    }
    
}

public extension String.Index{
    
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
