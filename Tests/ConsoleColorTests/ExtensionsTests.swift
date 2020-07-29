import XCTest
@testable import ConsoleColor

final class ExtensionsTests: XCTestCase {
    func testApplyCCFormatSimpleColor() throws {
        var message = "hello world"
        message.applyCCFormat(textColor: .red, background: .yellow, decorations: [.italic, .invert])
        XCTAssertTrue(message == "\u{001b}[31;43;3;7mhello world\u{001b}[0m")
    }

    func testApplyCCFormatEightBitColor() throws {
        var message = "hello world"
        message.applyCCFormat(eightBitTextColor: (255, 0, 0),
                              eightBitBackground: (255, 255, 0),
                              decorations: [.italic, .invert])
        XCTAssertTrue(message == "\u{001b}[38;2;255;0;0;48;2;255;255;0;3;7mhello world\u{001b}[0m")
    }

    func testClearFormat() throws {
        var message = "\u{001b}[38;2;255;0;0;48;2;255;255;0;3;7mhello world\u{001b}[0m"
        message.clearCCFormat()
        XCTAssertTrue(message == "hello world")
    }

    func testApplyingCCFormatSimpleColor() throws {
        let message = "hello world"
        let copy = message.applyingCCFormat(textColor: .red, background: .yellow, decorations: [.italic, .invert])
        XCTAssertTrue(copy == "\u{001b}[31;43;3;7mhello world\u{001b}[0m")
    }

    func testApplyingCCFormatEightBitColor() throws {
        let message = "hello world"
        let copy = message.applyingCCFormat(eightBitTextColor: (255, 0, 0),
                              eightBitBackground: (255, 255, 0),
                              decorations: [.italic, .invert])
        XCTAssertTrue(copy == "\u{001b}[38;2;255;0;0;48;2;255;255;0;3;7mhello world\u{001b}[0m")
    }

    func testClearingCCFormat() throws {
        let message = "\u{001b}[38;2;255;0;0;48;2;255;255;0;3;7mhello world\u{001b}[0m"
        let copy = message.clearingCCFormat()
        XCTAssertTrue(copy == "hello world")
    }

    func testStackedApplies() throws {
        let message = "hello world"
        let copy = message
            .applyingCCFormat(textColor: .red, background: .blue, decorations: [.invert, .strikethrough])
            .clearingCCFormat()
        XCTAssertTrue(copy == message)
    }
}
