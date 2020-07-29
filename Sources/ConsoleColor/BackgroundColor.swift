public extension ConsoleColor {
    /// Enumeration for holding the string values of simple background colors.
    enum BackgroundColor: String, CaseIterable {
        case black = "40"
        case red = "41"
        case green = "42"
        case yellow = "43"
        case blue = "44"
        case magenta = "45"
        case cyan = "46"
        case white = "47"

        // "bright" background colors
        case blackBright = "100"
        case redBright = "101"
        case greenBright = "102"
        case yellowBright = "103"
        case blueBright = "104"
        case magentaBright = "105"
        case cyanBright = "106"
        case whiteBright = "107"
    }
}
