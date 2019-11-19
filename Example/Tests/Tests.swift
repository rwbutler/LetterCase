import XCTest
import LetterCase

class Tests: XCTestCase {
    
    private let exampleString = "The quick brown fox jumped over the lazy dog."

    func testConversionToRegularCase() {
        let expectedResult = exampleString
        let result = exampleString.letterCase(.regular)
        XCTAssert(result == expectedResult, "No transformation applied therefore strings should be equal.")
    }
    
    func testConversionToCapitalizedCase() {
        let expectedResult = "The Quick Brown Fox Jumped Over The Lazy Dog."
        let result = exampleString.letterCase(.capitalized)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToKebabCase() {
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = exampleString.letterCase(.kebab)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToLowerCase() {
        let expectedResult = "the quick brown fox jumped over the lazy dog."
        let result = exampleString.letterCase(.lower)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToLowerCamelCase() {
        let expectedResult = "theQuickBrownFoxJumpedOverTheLazyDog"
        let result = exampleString.letterCase(.lowerCamel)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToMacroCase() {
        let expectedResult = "THE_QUICK_BROWN_FOX_JUMPED_OVER_THE_LAZY_DOG"
        let result = exampleString.letterCase(.macro)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToSnakeCase() {
        let expectedResult = "the_quick_brown_fox_jumped_over_the_lazy_dog"
        let result = exampleString.letterCase(.snake)
        let message = "Result was '\(result)' should be equal to the expected result string '\(expectedResult)'."
        XCTAssert(result == expectedResult, message)
    }
    
    func testConversionToUpperCase() {
        let expectedResult = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG."
        let result = exampleString.letterCase(.upper)
        XCTAssert(result == expectedResult, "Result should be equal to the expected result string.")
    }
    
    func testConversionToUpperCamelCase() {
        let expectedResult = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let result = exampleString.letterCase(.upperCamel)
        XCTAssert(result == expectedResult, "Result should be equal to the expected result string.")
    }

}
