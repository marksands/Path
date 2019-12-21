internal struct DirectoryName: ExpressibleByStringLiteral, Hashable {
    internal typealias StringLiteralType = String
    internal var rawValue: String
    
    internal init(stringLiteral value: String) {
        self.rawValue = value
    }

    internal init(_ value: String) {
        self.rawValue = value
    }
}
