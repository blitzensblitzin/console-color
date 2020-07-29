import XCTest
@testable import ConsoleColor

final class ConsoleColorTests: XCTestCase {
    func testAddFormatSimple() throws {
        var message = "hello world"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue)
        XCTAssertTrue(message == "\u{001b}[31mhello world\u{001b}[0m")
    }

    func testAddMultipleFormats() throws {
        var message = "hello world"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue)
        ConsoleColor.addFormat(to: &message, using: BackgroundColor.yellow.rawValue)
        ConsoleColor.addFormat(to: &message, using: Decoration.italic.rawValue)
        XCTAssertTrue(message == "\u{001b}[31;43;3mhello world\u{001b}[0m")
    }

    func testAddFormatSimpleWithNoReset() throws {
        var message = "hello world"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue, addResetSequence: false)
        XCTAssertTrue(message == "\u{001b}[31mhello world")
    }

    func testAddMultipleFormatsWithNoReset() throws {
        var message = "hello world"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue, addResetSequence: false)
        ConsoleColor.addFormat(to: &message, using: BackgroundColor.yellow.rawValue, addResetSequence: false)
        ConsoleColor.addFormat(to: &message, using: Decoration.italic.rawValue, addResetSequence: false)
        XCTAssertTrue(message == "\u{001b}[31;43;3mhello world")
    }

    func testNoResetWithResetAlreadyInInput() throws {
        var message = "hello world\u{001b}[0m"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue, addResetSequence: false)
        XCTAssertTrue(message == "\u{001b}[31mhello world")
    }

    func testClearFormat() throws {
        var message = "hello world"
        ConsoleColor.addFormat(to: &message, using: ForegroundColor.red.rawValue)
        ConsoleColor.addFormat(to: &message, using: BackgroundColor.yellow.rawValue)
        ConsoleColor.addFormat(to: &message, using: Decoration.italic.rawValue)

        ConsoleColor.clearFormat(from: &message)
        XCTAssertTrue(message == "hello world")
    }
}
