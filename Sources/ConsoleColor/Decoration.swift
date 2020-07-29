public extension ConsoleColor {
    /// Enumeration for holding the string values of simple text decorations.
    enum Decoration: String, CaseIterable {
        case bold = "1"
        case italic = "3"
        case underline = "4"
        case invert = "7"
        case strikethrough = "9"
    }
}
