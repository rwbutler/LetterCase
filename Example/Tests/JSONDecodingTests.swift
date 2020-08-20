//
//  JSONDecodingTests.swift
//  LetterCase_Tests
//
//  Created by Ross Butler on 19/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import LetterCase
import XCTest

struct Vehicles: Codable {
    let vehicles: [Vehicle]
}

struct Vehicle: Codable {
    let name: String
    let travelsOn: Medium
    let numberOfWheels: Int
}

enum Medium: String, Codable {
    case air
    case rail
    case road
    case water
}

enum UnitTestingError: Error {
    case missingTestBundleResource(named: String, extension: String)
}

class JSONDecodingTests: XCTestCase {
    
    private let exampleString = "The quick brown fox jumped over the lazy dog."
    
    private func dataForJSONResourceInBundle(named resourceName: String) throws -> Data {
        let resourceExtension = "json"
        guard let resourceJSONURL = Bundle.init(for: JSONDecodingTests.self)
            .url(forResource: resourceName, withExtension: resourceExtension) else {
                throw UnitTestingError.missingTestBundleResource(named: resourceName, extension: resourceExtension)
        }
        let resourceData = try Data(contentsOf: resourceJSONURL)
        return resourceData
    }
    
    func testDecodingJSONContainingKebabCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-kebab-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromKebabCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingSnakeCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-snake-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.letterCaseStrategy(for: .snake)
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingScreamingMacroCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-screaming-snake-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromMacroCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingScreamingSnakeCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-screaming-snake-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromScreamingSnakeCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingTrainCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-train-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromTrainCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingLowerCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-lower-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromLowerCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingUpperCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-upper-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromUpperCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingCapitalizedKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-capitalized")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromCapitalized
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingUpperCamelCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-upper-camel-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromUpperCamelCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
    func testDecodingJSONContainingLowerCamelCaseKeys() throws {
        let resourceData = try dataForJSONResourceInBundle(named: "vehicles-lower-camel-case")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromLowerCamelCase
        XCTAssertNoThrow(try decoder.decode(Vehicles.self, from: resourceData))
    }
    
}
