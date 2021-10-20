//
//  File.swift
//  
//
//  Created by Rick Street on 10/20/21.
//

import Cocoa

public let lightYellow = NSColor(red: 255.0/255.0, green: 255.0/255.0, blue: 198.0/255.0, alpha: 1.0)
public let darkGrey = NSColor(red: 127.0/255.0, green: 127.0/255.0, blue: 127.0/255.0, alpha: 1.0)
public let lightGrey = NSColor(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)

public let pink = NSColor(red: 255.0/255.0, green: 231.0/255.0, blue: 235.0/255.0, alpha: 1.0)
public let darkRed = NSColor(red: 137.0/255.0, green: 33.0/255.0, blue: 16.0/255.0, alpha: 1.0)
public let navy = NSColor(red: 4.0/255.0, green: 30.0/255.0, blue: 141.0/255.0, alpha: 1.0)
public let forestGreen = NSColor(red: 0.0/255.0, green: 153.0/255.0, blue: 76.0/255.0, alpha: 1.0)
public let black = NSColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)


public var headerParagraphStyle = NSMutableParagraphStyle()

public var normalParagraphStyle = NSMutableParagraphStyle()

public var convParagraphStyle = NSMutableParagraphStyle()

public var titleAttribute = [ NSAttributedString.Key.foregroundColor: navy,
                      NSAttributedString.Key.font: NSFont(name: "HelveticaNeue-BoldItalic", size: 20.0)!]

public var headerAttribute = [ NSAttributedString.Key.foregroundColor: navy,
                       NSAttributedString.Key.font: NSFont(name: "HelveticaNeue-Italic", size: 12.0)!]

public var normalAttribute = [ NSAttributedString.Key.foregroundColor: black,
                        NSAttributedString.Key.font: NSFont(name: "HelveticaNeue", size: 10.0)!]
/*
var convAttributes = [ NSAttributedString.Key.foregroundColor: black,
                       NSAttributedString.Key.font: NSFont(name: "HelveticaNeue", size: 10.0)!]
*/

public var smallAttribute = [ NSAttributedString.Key.foregroundColor: navy, NSAttributedString.Key.font: NSFont(name: "HelveticaNeue", size: 6.0)!]

