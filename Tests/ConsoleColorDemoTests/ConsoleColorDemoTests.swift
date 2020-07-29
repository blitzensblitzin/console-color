import Foundation
import XCTest

final class ConsoleColorDemoTests: XCTestCase {
    func testExecutable() throws {
        guard #available(macOS 10.13, *) else { return }
        let binary = productsDirectory.appendingPathComponent("console-color-demo")
        let process = Process()
        let outputPipe = Pipe()
        process.executableURL = binary
        process.standardOutput = outputPipe
        process.arguments = ["hello", "-t", "red", "-b", "yellow", "-d", "italic"]
        try process.run()
        process.waitUntilExit()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: outputData, encoding: .utf8)
        XCTAssertTrue(output == "\u{001b}[31;43;3mhello\u{001b}[0m\n")
    }

    func testExecutableNoInput() throws {
        guard #available(macOS 10.13, *) else { return }
        let binary = productsDirectory.appendingPathComponent("console-color-demo")
        let process = Process()
        let outputPipe = Pipe()
        process.executableURL = binary
        process.standardOutput = outputPipe
        try process.run()
        process.waitUntilExit()
        let status = process.terminationStatus
        XCTAssertTrue(status != 0)
    }

    var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("Couldn't find the products directory.")
        #else
        return Bundle.main.bundleURL
        #endif
    }
}
