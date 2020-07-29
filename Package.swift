// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "console-color",
    products: [
        .library(
            name: "ConsoleColor",
            targets: ["ConsoleColor"]),
        .executable(
            name: "console-color-demo",
            targets: ["ConsoleColorDemo"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            .upToNextMinor(from: "0.2.0")),
    ],
    targets: [
        .target(
            name: "ConsoleColor",
            dependencies: []),
        .target(
            name: "ConsoleColorDemo",
            dependencies: [
                "ConsoleColor",
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "ConsoleColorTests",
            dependencies: ["ConsoleColor"]),
        .testTarget(
            name: "ConsoleColorDemoTests",
            dependencies: ["ConsoleColorDemo"]),
    ]
)
