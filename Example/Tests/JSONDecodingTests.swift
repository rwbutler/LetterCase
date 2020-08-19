//
//  JSONDecodingTests.swift
//  LetterCase_Tests
//
//  Created by Ross Butler on 19/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
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

class JSONDecodingTests: XCTestCase {
    
    private let exampleString = "The quick brown fox jumped over the lazy dog."
    
    func testConversionToRegularCase() throws {
        guard let testJSONURL = Bundle.init(for: JSONDecodingTests.self)
            .url(forResource: "Vehicles", withExtension: "json") else {
            XCTFail("Vehicles.json missing from test bundle.")
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromKebabCase
        let testData = try Data(contentsOf: testJSONURL)
        let result = try decoder.decode(Vehicles.self, from: testData)
        XCTAssertNotNil(result)
    }
    
}
