import XCTest

import ConsoleColorDemoTests
import ConsoleColorTests

var tests = [XCTestCaseEntry]()
tests += ConsoleColorDemoTests.__allTests()
tests += ConsoleColorTests.__allTests()

XCTMain(tests)
