import XCTest
@testable import ConsoleColor

final class EightBitColorTests: XCTestCase {
    func testNormalInput() throws {
        for i in 0...255 {
            let color = EightBitColor(value: i)
            XCTAssertTrue(color.value == String(i))
        }
    }

    func testInputOver255() throws {
        for i in 255...300 {
            let color = EightBitColor(value: i)
            XCTAssertTrue(color.value == "255")
        }
    }

    func testInputLessThan0() throws {
        for i in -100...0 {
            let color = EightBitColor(value: i)
            XCTAssertTrue(color.value == "0")
        }
    }
}
