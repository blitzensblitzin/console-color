import Foundation

/// A static structure for wrapping other types. For example,
/// `ConsoleColor.ForegroundColor`, `ConsoleColor.BackgroundColor`,
/// and `ConsoleColor.EightBitColor`.
public struct ConsoleColor {

    /// No initialization is necessary.
    private init() {}

    /// Used to clear all formats declared before adding this to a String.
    public static let resetSequence = "\u{001b}[0m"

    /// Regex pattern to match resetSequence at the end of a String.
    static let resetPattern = #"\e\[0m$"#

    /// Regex pattern to match any ANSI escape sequence at the
    /// beginning of a String.
    static let ANSIPattern = #"^\e\[(?:\d+;)*\d+;?m"#

    /// Regex pattern to match any ANSI escape sequence, no matter where it is
    /// in a String.
    static let generalANSIpattern = #"\e\[(?:\d+;)*\d+;?m"#

    /// Modify the incoming `message` by adding `code` as an ANSI escape
    /// sequence to the beginning. If `addResetSequence` is specified, the
    /// ANSI reset sequence will also be added if not already present. If set
    /// to `false`, the reset sequence will be removed if present.
    static func addFormat(to message: inout String,
                          using code: String?,
                          addResetSequence: Bool = true) {
        // Handle the reset parameter
        let resetRange = message.range(of: resetPattern,
                                       options: .regularExpression)
        if addResetSequence {
            // Check if a reset sequence is present and append it if not present
            if resetRange == nil {
                message.append(contentsOf: resetSequence)
            }
        } else {
            // Check if a reset sequence is present and remove it if present
            if resetRange != nil {
                message.removeSubrange(resetRange!)
            }
        }

        // Handle addition of new sequence if one is given
        if let code = code {
            let ansiRange = message.range(of: ANSIPattern,
                                          options: .regularExpression)
            if ansiRange == nil {
                // If there is no sequence present at the beginning of the
                // message, add a fresh escape sequence
                message.insert(contentsOf: "\u{001b}[\(code)m",
                               at: message.startIndex)
            } else {
                // Get the current escape sequence
                var newSequence = message[ansiRange!]

                // Add format code
                let justBeforeM = newSequence.firstIndex(of: "m")!
                newSequence.insert(contentsOf: ";\(code)", at: justBeforeM)

                // Replace old sequence with new in working string
                message.replaceSubrange(ansiRange!, with: newSequence)
            }
        }
    }

    /// Remove all ANSI escape sequences from the given `message`, including
    /// text, background, decoration, and reset codes.
    static func clearFormat(from message: inout String) {
        // Keep removing sequences as long as we can pull them out
        while let range = message.range(of: generalANSIpattern,
                                        options: .regularExpression) {
            message.removeSubrange(range)
        }
    }
}
