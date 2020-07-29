public extension String {
    /// Apply the specified formats via mutation.
    ///
    /// If `addResetSequence` is set to `false`, formats will persist on the terminal until a
    /// reset sequence is printed.
    ///
    /// - Parameters:
    ///   - textColor: Select a text color via a `ConsoleColor.ForegroundColor` enumeration instance.
    ///   - background: Select a background color via a `ConsoleColor.BackgroundColor` enumeration instance.
    ///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
    ///   - r: Whether or not to include the ANSI reset sequence at the end of the String.
    mutating func applyCCFormat(textColor: ForegroundColor?,
                                background: BackgroundColor? = nil,
                                decorations: [Decoration]? = nil,
                                addResetSequence r: Bool = true) {
        if let textColor = textColor {
            ConsoleColor.addFormat(to: &self,
                                   using: textColor.rawValue,
                                   addResetSequence: r)
        }

        if let background = background {
            ConsoleColor.addFormat(to: &self,
                                   using: background.rawValue,
                                   addResetSequence: r)
        }

        if let decorations = decorations {
            decorations.forEach {
                ConsoleColor.addFormat(to: &self,
                                       using: $0.rawValue,
                                       addResetSequence: r)
            }
        }
    }

    /// Apply the specified formats via mutation.
    ///
    /// If `addResetSequence` is set to `false`, formats will persist on the terminal until a
    /// reset sequence is printed.
    ///
    /// - Parameters:
    ///   - eightBitTextColor: A three-tuple consisting of RGB values for the text color.
    ///   - eightBitBackground: A three-tuple consisting of RGB values for the background color.
    ///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
    ///   - r: Whether or not to include the ANSI reset sequence at the end of the String.
    mutating func applyCCFormat(eightBitTextColor: (red: EightBitColor,
                                                    green: EightBitColor,
                                                    blue: EightBitColor)?,
                                eightBitBackground: (red: EightBitColor,
                                                     green: EightBitColor,
                                                     blue: EightBitColor)? = nil,
                                decorations: [Decoration]? = nil,
                                addResetSequence r: Bool = true) {

        if let textColor = eightBitTextColor {
            ConsoleColor.addFormat(to: &self, using: "38", addResetSequence: r)
            ConsoleColor.addFormat(to: &self, using: "2", addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: textColor.red.value,
                                   addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: textColor.green.value,
                                   addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: textColor.blue.value,
                                   addResetSequence: r)
        }

        if let background = eightBitBackground {
            ConsoleColor.addFormat(to: &self, using: "48", addResetSequence: r)
            ConsoleColor.addFormat(to: &self, using: "2", addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: background.red.value,
                                   addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: background.green.value,
                                   addResetSequence: r)
            ConsoleColor.addFormat(to: &self,
                                   using: background.blue.value,
                                   addResetSequence: r)
        }

        applyCCFormat(textColor: nil,
                      decorations: decorations,
                      addResetSequence: r)
    }

    /// Remove all format sequences via mutation.
    mutating func clearCCFormat() {
        ConsoleColor.clearFormat(from: &self)
    }

    /// Create and return a new string with the specified formats.
    ///
    /// If `addResetSequence` is set to `false`, formats will persist on the terminal until a
    /// reset sequence is printed.
    ///
    /// - Parameters:
    ///   - textColor: Select a text color via a `ConsoleColor.ForegroundColor` enumeration instance.
    ///   - background: Select a background color via a `ConsoleColor.BackgroundColor` enumeration instance.
    ///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
    ///   - r: Whether or not to include the ANSI reset sequence at the end of the String.
    /// - Returns: A new String instance with the specified formats applied.
    func applyingCCFormat(textColor: ForegroundColor?,
                          background: BackgroundColor? = nil,
                          decorations: [Decoration]? = nil,
                          addResetSequence r: Bool = true) -> String {
        var copy = self
        copy.applyCCFormat(textColor: textColor,
                           background: background,
                           decorations: decorations,
                           addResetSequence: r)
        return copy
    }

    /// Create and return a new string with the specified formats.
    ///
    /// If `addResetSequence` is set to `false`, formats will persist on the terminal until a
    /// reset sequence is printed.
    ///
    /// - Parameters:
    ///   - eightBitTextColor: A three-tuple consisting of RGB values for the text color.
    ///   - eightBitBackground: A three-tuple consisting of RGB values for the background color.
    ///   - decorations: Select a text decoration via a `ConsoleColor.Decoration` enumeration instance.
    ///   - r: Whether or not to include the ANSI reset sequence at the end of the String.
    /// - Returns: A new String instance with the specified formats applied.
    func applyingCCFormat(eightBitTextColor: (red: EightBitColor,
                                              green: EightBitColor,
                                              blue: EightBitColor)?,
                          eightBitBackground: (red: EightBitColor,
                                               green: EightBitColor,
                                               blue: EightBitColor)? = nil,
                          decorations: [Decoration]? = nil,
                          addResetSequence r: Bool = true) -> String {
        var copy = self
        copy.applyCCFormat(eightBitTextColor: eightBitTextColor,
                           eightBitBackground: eightBitBackground,
                           decorations: decorations,
                           addResetSequence: r)
        return copy
    }

    /// Remove all format sequences and return as a new String.
    ///
    /// - Returns: A new String with no ANSI codes.
    func clearingCCFormat() -> String {
        var copy = self
        copy.clearCCFormat()
        return copy
    }
}
