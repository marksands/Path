import Foundation

extension Path where K == Absolute, T == File {
    public var fileURL: URL {
        return self.internal.fileURL
    }
}

extension Path where K == Relative, T == File {
    public var fileURL: URL {
        return self.internal.fileURL
    }
}
