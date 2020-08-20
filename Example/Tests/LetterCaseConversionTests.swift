import XCTest
import LetterCase

class LetterCaseConversionTests: XCTestCase {
    
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
    
    // MARK: - Conversions
    
    func testConversionFromKebabCaseToLowerCamelCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "theQuickBrownFoxJumpedOverTheLazyDog"
        let result = input.convert(from: .kebab, to: .lowerCamel)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToUpperCamelCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let result = input.convert(from: .kebab, to: .upperCamel)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToSnakeCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "the_quick_brown_fox_jumped_over_the_lazy_dog"
        let result = input.convert(from: .kebab, to: .snake)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToMacroCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "THE_QUICK_BROWN_FOX_JUMPED_OVER_THE_LAZY_DOG"
        let result = input.convert(from: .kebab, to: .macro)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromCapitalizedToKebabCase() {
        let input = "The Quick Brown Fox Jumped Over The Lazy Dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .capitalized, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToKebabCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .kebab, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromLowerCaseToKebabCase() {
        let input = "the quick brown fox jumped over the lazy dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .lower, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromLowerCamelCaseToKebabCase() {
        let input = "theQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .lowerCamel, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromMacroCaseToKebabCase() {
        let input = "THE_QUICK_BROWN_FOX_JUMPED_OVER_THE_LAZY_DOG"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .macro, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromRegularCaseToKebabCase() {
        let input = "the quick brown fox jumped over the lazy dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .regular, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromSnakeCaseToKebabCase() {
        let input = "the_quick_brown_fox_jumped_over_the_lazy_dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .snake, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromTrainCaseToKebabCase() {
        let input = "THE-QUICK-BROWN-FOX-JUMPED-OVER-THE-LAZY-DOG"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .train, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCaseToKebabCase() {
        let input = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .upper, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToKebabCase() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .upperCamel, to: .kebab)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToRegularCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let result = input.convert(from: .kebab, to: .regular)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToCapitalized() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "The Quick Brown Fox Jumped Over The Lazy Dog"
        let result = input.convert(from: .kebab, to: .capitalized)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToLowerCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "the quick brown fox jumped over the lazy dog"
        let result = input.convert(from: .kebab, to: .lower)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToTrainCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "THE-QUICK-BROWN-FOX-JUMPED-OVER-THE-LAZY-DOG"
        let result = input.convert(from: .kebab, to: .train)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromKebabCaseToUpperCase() {
        let input = "the-quick-brown-fox-jumped-over-the-lazy-dog"
        let expectedResult = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"
        let result = input.convert(from: .kebab, to: .upper)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToRegularCase() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let result = input.convert(from: .upperCamel, to: .regular)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToCapitalized() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "The Quick Brown Fox Jumped Over The Lazy Dog"
        let result = input.convert(from: .upperCamel, to: .capitalized)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToLowerCase() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "the quick brown fox jumped over the lazy dog"
        let result = input.convert(from: .upperCamel, to: .lower)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToLowerCamelCase() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "theQuickBrownFoxJumpedOverTheLazyDog"
        let result = input.convert(from: .upperCamel, to: .lowerCamel)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testConversionFromUpperCamelCaseToMacroCase() {
        let input = "TheQuickBrownFoxJumpedOverTheLazyDog"
        let expectedResult = "THE_QUICK_BROWN_FOX_JUMPED_OVER_THE_LAZY_DOG"
        let result = input.convert(from: .upperCamel, to: .macro)
        XCTAssertEqual(result, expectedResult)
    }

}
