//
//  StringAdditions.swift
//  LetterCase
//
//  Created by Ross Butler on 11/19/19.
//

import Foundation

public extension String {
    
    func letterCase(_ letterCase: LetterCase, options: LetterCase.Options = []) -> String {
        switch letterCase {
        case .capitalized:
            return capitalized(options: options)
        case .kebab:
            return kebabCased(options: options)
        case .lower:
            return lowerCased(options: options)
        case .lowerCamel:
            return lowerCamelCased(options: options)
        case .macro:
            return macroCased(options: options)
        case .snake:
            return snakeCased(options: options)
        case .upper:
            return upperCased(options: options)
        case .upperCamel:
            return upperCamelCased(options: options)
        default:
            var input = self
            if options.contains(.stripPunctuation) {
                input = stripPunctuation(input)
            }
            return input
        }
    }
    
    func capitalized(options: LetterCase.Options = []) -> String {
        var input = self
        if options.contains(.stripPunctuation) {
            input = stripPunctuation(input)
        }
        return input.capitalized
    }
    
    func kebabCased(options: LetterCase.Options = []) -> String {
        var options: LetterCase.Options = options
        if !options.contains(.preservePunctuation) {
            options.update(with: .stripPunctuation)
        }
        return capitalizeSubSequences(capitalizeFirst: false, conjunction: "-", options: options)
    }
    
    func lowerCased(options: LetterCase.Options = []) -> String {
        var input = self
        if options.contains(.stripPunctuation) {
            input = stripPunctuation(input)
        }
        return input.lowercased()
    }
    
    func lowerCamelCased(options: LetterCase.Options = []) -> String {
        var options: LetterCase.Options = options
        if !options.contains(.preservePunctuation) {
            options.update(with: .stripPunctuation)
        }
        let upperCamelCased = self.upperCamelCased(options: options)
        if let firstChar = upperCamelCased.first {
            return String(firstChar).lowercased() + String(upperCamelCased.dropFirst())
        }
        return upperCamelCased
    }
    
    func macroCased(options: LetterCase.Options = []) -> String {
        var options: LetterCase.Options = [options]
        if !options.contains(.preservePunctuation) {
            options.update(with: .stripPunctuation)
        }
        return capitalizeSubSequences(capitalizeFirst: true, conjunction: "_", options: options).uppercased()
    }
    
    func snakeCased(options: LetterCase.Options = []) -> String {
        var options: LetterCase.Options = options
        if !options.contains(.preservePunctuation) {
            options.update(with: .stripPunctuation)
        }
        return capitalizeSubSequences(capitalizeFirst: false, conjunction: "_", options: options)
    }
    
    func upperCamelCased(options: LetterCase.Options = []) -> String {
        var options: LetterCase.Options = options
        if !options.contains(.preservePunctuation) {
            options.update(with: .stripPunctuation)
        }
        return capitalizeSubSequences(capitalizeFirst: true, options: options)
    }
    
    func upperCased(options: LetterCase.Options = []) -> String {
        var input = self
        if options.contains(.stripPunctuation) {
            input = stripPunctuation(input)
        }
        return input.uppercased()
    }
    
}

// Private API
private extension String {
    
    func capitalizeSubSequences(capitalizeFirst: Bool, conjunction: String = "",
                                options: LetterCase.Options = []) -> String {
        var result = ""
        for subSequence in self.split(separator: " ") {
            if let firstChar = subSequence.first {
                let prefixWithCase = (capitalizeFirst) ? String(firstChar).uppercased() : String(firstChar).lowercased()
                let suffix = String(subSequence.dropFirst())
                let suffixWithCase = options.contains(.preserveSuffix) ? suffix : suffix.lowercased()
                result += prefixWithCase + suffixWithCase + conjunction
            }
        }
        if !conjunction.isEmpty, !result.isEmpty {
            result = String(result.dropLast())
        }
        if options.contains(.stripPunctuation) {
            result = stripPunctuation(result, except: conjunction.first)
        }
        return result
    }
    
    /// Strips punctuation from the provided input `String` leaving only alphanumeric characters except
    /// for a given special character if one is specified.
    private func stripPunctuation(_ input: String, except: Character? = nil) -> String {
        let chars = input.compactMap {
            return ($0.isLetter || $0.isWholeNumber || $0 == except) ? $0 : nil
        }
        return String(chars)
    }
    
}
