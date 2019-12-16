import Foundation

extension InternalPath where K == Relative, T == File {
    internal var fileURL: URL {
        return URL(fileURLWithPath: render())
    }
}

extension InternalPath where K == Absolute, T == File {
    internal var fileURL: URL {
        return URL(fileURLWithPath: render())
    }
}
