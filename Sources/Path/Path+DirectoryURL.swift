import Foundation

extension Path where K == Absolute, T == Directory {
    public var directoryURL: URL {
        return self.internal.directoryURL
    }
}

extension Path where K == Relative, T == Directory {
    public var directoryURL: URL {
        return self.internal.directoryURL
    }
}

extension Path where K == Absolute, T == File {
    public var directoryURL: URL {
        return self.internal.directoryURL
    }
}

extension Path where K == Relative, T == File {
    public var directoryURL: URL {
        return self.internal.directoryURL
    }
}
