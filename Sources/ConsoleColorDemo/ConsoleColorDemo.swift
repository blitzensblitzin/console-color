import ArgumentParser
import ConsoleColor

struct ConsoleColorsDemo: ParsableCommand {
    private(set) static var configuration = CommandConfiguration(
        abstract: "An executable demo for the ConsoleColors package.",
        version: "0.1.0")

    @Argument(help: "The message to format.")
    var message: String

    @Option(name: .short, help: ArgumentHelp("The color to apply to the message.",
                                             discussion: """
                                                         One of black, red, green, yellow, blue, \
                                                         magenta, cyan, or white. Optionally add \
                                                         suffix "-bright". For example, red-bright.
                                                         """,
                                             valueName: "text color"))
    var textColor: FormatBox<ConsoleColor.ForegroundColor>?

    @Option(name: .short, help: ArgumentHelp("The color to apply to the message's background.",
                                             discussion: """
                                                         One of black, red, green, yellow, blue, \
                                                         magenta, cyan, or white. Optionally add \
                                                         suffix "-bright". For example, red-bright.
                                                         """,
                                             valueName: "background color"))
    var backgroundColor: FormatBox<ConsoleColor.BackgroundColor>?

    @Option(name: .short, help: ArgumentHelp("The decoration(s) to apply to the message.",
                                             discussion: """
                                                         Zero or more of bold, italic, underline, \
                                                         invert, or strikethrough.
                                                         """,
                                             valueName: "decoration"))
    var decoration: [FormatBox<ConsoleColor.Decoration>] = []

    func run() throws {
        var message = self.message
        if let textColor = textColor {
            message.applyCCFormat(textColor: textColor.format)
        }
        if let backgroundColor = backgroundColor {
            message.applyCCFormat(textColor: nil, background: backgroundColor.format)
        }
        if decoration.count > 0 {
            message.applyCCFormat(textColor: nil, decorations: decoration.map { $0.format })
        }
        print(message)
    }
}
