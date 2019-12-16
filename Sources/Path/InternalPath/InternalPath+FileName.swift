public struct FileName: RawRepresentable, ExpressibleByStringLiteral, Hashable {
    public typealias StringLiteralType = String
    public var rawValue: String
    
    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public init(rawValue value: String) {
        self.rawValue = value
    }
}
