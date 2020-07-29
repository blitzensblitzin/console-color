public extension ConsoleColor {
    /// Enumeration for holding the string values of simple
    /// text/foreground colors.
    enum ForegroundColor: String, CaseIterable {
        case black = "30"
        case red = "31"
        case green = "32"
        case yellow = "33"
        case blue = "34"
        case magenta = "35"
        case cyan = "36"
        case white = "37"

        // "Bright" foreground colors
        case blackBright = "90"
        case redBright = "91"
        case greenBright = "92"
        case yellowBright = "93"
        case blueBright = "94"
        case magentaBright = "95"
        case cyanBright = "96"
        case whiteBright = "97"
    }
}
