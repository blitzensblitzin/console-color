import ArgumentParser

struct FormatBox<T: CaseIterable>: ExpressibleByArgument {
    var format: T
    init?(argument: String) {
        var argument = argument
        if argument.contains("-bright") {
            argument.removeSubrange(argument.firstIndex(of: "-")!..<argument.endIndex)
            argument.append(contentsOf: "Bright")
        }
        for color in T.allCases {
            if "\(color)" == argument {
                self.format = color
                return
            }
        }
        return nil
    }
}
