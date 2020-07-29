# Console Color

Console Color is lightweight package for creating colored strings when printing
to standard output.

```swift
import ConsoleColor
var greeting = "Hello, world!"
greeting.applyCCFormat(textColor: .blue)

debugPrint(greeting)
// Prints "\u{1B}[34mHello, world!\u{1B}[0m"

print(greeting)
// Prints "Hello, world!" in blue
```

## Installation

### Using Swift Package Manager

Include this line to your dependencies in `Package.swift`:

```swift
let package = Package(
    // ...
    dependencies: [
        .package(
            url: "https://github.com/blitzensblitzin/console-color.git",
            from: "0.1.0"),
        ]
    // ...
)
```

### Cloning the Repo

If cloning the repo manually, you have a bit more flexibility with the things
you can play around with.

```shell script
git clone https://github.com/blitzensblitzin/console-color.git
cd console-color
```

#### Running the Demo

I have added a small executable demo to preview what the colors will look like
when using this package.

```shell script
swift run console-color-demo
```

```
OVERVIEW: An executable demo for the ConsoleColors package.

USAGE: console-colors-demo <message> [-t <text color>] [-b <background color>]
[-d <decoration> ...]

ARGUMENTS:
  <message>               The message to format.

OPTIONS:
  -t <text color>         The color to apply to the message.
        One of black, red, green, yellow, blue, magenta, cyan, or white.
        Optionally add suffix "-bright". For example, red-bright.
  -b <background color>   The color to apply to the message's background.
        One of black, red, green, yellow, blue, magenta, cyan, or white.
        Optionally add suffix "-bright". For example, red-bright.
  -d <decoration>         The decoration(s) to apply to the message.
        Zero or more of bold, italic, underline, invert, or strikethrough.
  --version               Show the version.
  -h, --help              Show help information.
```

For example, to print italicized, underlined red text on a blue background,
run:

```shell script
swift run console-color-demo "hello world\!" -t red -b blue -d italic -d underline
```

## At a Glance

### `String` Extensions

The package exports a few extensions on `String`, with mutating and non-mutating
pairs.

```swift
// Mutating
applyCCFormat(textColor:background:decorations:addResetSequence:)
applyCCFormat(eightBitTextColor:eightBitBackground:decorations:addResetSequence:)
clearCCFormat()

// Non-mutating
applyingCCFormat(textColor:background:decorations:addResetSequence:)
applyingCCFormat(eightBitTextColor:eightBitBackground:decorations:addResetSequence:)
clearingCCFormat()
```

The function signatures with `eightBitTextColor` and `eightBitBackground` allow
you to select precisely which color is applied to the text by supplying RGB
values as a tuple. For example:

```swift
let greeting = "hello world".applyingCCFormat(eightBitTextColor: (255, 255, 0))
```

The input tuple also supports naming of each integer value.

```swift
let greeting = "hello world".applyingCCFormat(
        eightBitTextColor: (red: 255, green: 255, blue: 0))
```

The other function signatures accept an enumerable type as input. Check the
source files for [foreground colors](Sources/ConsoleColor/ForegroundColor.swift),
[background colors](Sources/ConsoleColor/BackgroundColor.swift) colors, and
[decorations](Sources/ConsoleColor/Decoration.swift).

### `ccPrint`

The function `ccPrint` allows you to merely print a colored message without
needing to modify the input. `ccPrint` has two signatures:

```swift
ccPrint(_:textColor:background:decorations:separator:terminator:)
ccPrint(_:eightBitTextColor:eightBitBackground:decorations:separator:terminator:)
```

The `ccPrint` parameters take in the same input as the `String` extensions do.
For example:

```swift
ccPrint("Hello world!", eightBitTextColor: (255, 255, 0))
```
