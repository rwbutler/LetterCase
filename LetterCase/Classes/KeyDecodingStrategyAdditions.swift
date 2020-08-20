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
    
    // MARK: - Aliases
    
    static let convertFromCapitalized = letterCaseStrategy(for: .capitalized)
    static let convertFromDashCase = letterCaseStrategy(for: .kebab)
    static let convertFromKebabCase = letterCaseStrategy(for: .kebab)
    static let convertFromLispCase = letterCaseStrategy(for: .kebab)
    static let convertFromLowerCase = letterCaseStrategy(for: .lower)
    static let convertFromLowerCamelCase = letterCaseStrategy(for: .lowerCamel)
    static let convertFromMacroCase = letterCaseStrategy(for: .macro)
    static let convertFromScreamingSnakeCase = letterCaseStrategy(for: .macro)
    static let convertFromTrainCase = letterCaseStrategy(for: .train)
    static let convertFromUpperCase = letterCaseStrategy(for: .upper)
    static let convertFromUpperCamelCase = letterCaseStrategy(for: .upperCamel)
    
    // MARK: - Conversion
    
    static func letterCaseStrategy(
        from letterCase: LetterCase,
        to newLetterCase: LetterCase
    ) -> JSONDecoder.KeyDecodingStrategy {
        return JSONDecoder.KeyDecodingStrategy.custom({ keys in
            // Should never receive an empty `keys` array in theory.
            guard let lastKey = keys.last else {
                return AnyKey.empty
            }
            // Represents an array index.
            if lastKey.intValue != nil {
                return lastKey
            }
            let newLetterCaseKey = lastKey.stringValue.convert(from: letterCase, to: newLetterCase)
            return AnyKey(string: newLetterCaseKey)
        })
    }
    
    static func letterCaseStrategy(for letterCase: LetterCase) -> JSONDecoder.KeyDecodingStrategy {
        return letterCaseStrategy(from: letterCase, to: .lowerCamel)
    }
    
}
