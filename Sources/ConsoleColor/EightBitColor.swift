public extension ConsoleColor {
    /// Structure for representing eight-bit RGB color values between 0 and 255.
    /// Can be expressed through integer literals for conveience.
    struct EightBitColor {
        let value: String

        public init(value: Int) {
            switch value {
            case let x where 0...255 ~= x:
                self.value = String(value)
            case let x where x < 0:
                self.value = "0"
            default:
                self.value = "255"
            }
        }
    }
}

extension ConsoleColor.EightBitColor: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value: value)
    }
}
