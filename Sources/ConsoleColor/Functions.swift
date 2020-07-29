/// An extension of the global `print(_:separator:terminator:)` function that prints
/// colored text without modifying the input string.
///
/// - Parameters:
///   - items: The items to print.
///   - textColor: Select a text color via a `ConsoleColor.ForegroundColor` enumeration instance.
///   - background: Select a background color via a `ConsoleColor.BackgroundColor` enumeration instance.
///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
///   - separator: Printed between each member of `items`, defaults to " ".
///   - terminator: Printed at the very end, defaults to "\n".
public func ccPrint(_ items: Any...,
                    textColor: ForegroundColor?,
                    background: BackgroundColor? = nil,
                    decorations: [Decoration]? = nil,
                    separator: String = " ",
                    terminator: String = "\n") {
    let start = "".applyingCCFormat(textColor: textColor,
                                    background: background,
                                    decorations: decorations,
                                    addResetSequence: false)
    let end = ConsoleColor.resetSequence
    print(start, terminator: "")
    for (index, item) in items.enumerated() {
        if index < items.count - 1 { print(item, terminator: separator) }
        else { print(item, terminator: "") }
    }
    print(end, terminator: terminator)
}

/// An extension of the global `print(_:separator:terminator:)` function that prints
/// colored text without modifying the input string.
///
/// - Parameters:
///   - items: The items to print.
///   - eightBitTextColor: A three-tuple consisting of RGB values for the text color.
///   - eightBitBackground: A three-tuple consisting of RGB values for the background color.
///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
///   - separator: Printed between each member of `items`, defaults to " ".
///   - terminator: Printed at the very end, defaults to "\n".
public func ccPrint(_ items: Any...,
                    eightBitTextColor: (red: EightBitColor,
                                        green: EightBitColor,
                                        blue: EightBitColor)?,
                    eightBitBackground: (red: EightBitColor,
                                         green: EightBitColor,
                                         blue: EightBitColor)? = nil,
                    decorations: [Decoration]? = nil,
                    separator: String = " ",
                    terminator: String = "\n") {
    let start = "".applyingCCFormat(eightBitTextColor: eightBitTextColor,
                                 eightBitBackground: eightBitBackground,
                                 decorations: decorations,
                                 addResetSequence: false)
    let end = ConsoleColor.resetSequence
    print(start, terminator: "")
    for (index, item) in items.enumerated() {
        if index < items.count - 1 { print(item, terminator: separator) }
        else { print(item, terminator: "") }
    }
    print(end, terminator: terminator)
}
