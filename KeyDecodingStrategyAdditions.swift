//
//  KeyDecodingStrategyAdditions.swift
//  LetterCase
//
//  Created by Ross Butler on 14/08/2020.
//

import Foundation

struct AnyKey: CodingKey {
    
    static let empty = AnyKey(string: "")
    
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
    
    init(string: String) {
        self.stringValue = string
        self.intValue = nil
    }
    
}

public extension JSONDecoder.KeyDecodingStrategy {
    
    static let convertFromKebabCase = JSONDecoder.KeyDecodingStrategy.custom({ keys in
        // Should never receive an empty `keys` array in theory.
        guard let lastKey = keys.last else {
            return AnyKey.empty
        }
        // Represents an array index.
        if lastKey.intValue != nil {
            return lastKey
        }
        let components = lastKey.stringValue.split(separator: "-")
        guard let firstComponent = components.first?.lowercased() else {
            return lastKey
        }
        let trailingComponents = components.dropFirst().map {
            $0.capitalized
        }
        let lowerCamelCaseKey = ([firstComponent] + trailingComponents).joined()
        return AnyKey(string: lowerCamelCaseKey)
    })
    
}
