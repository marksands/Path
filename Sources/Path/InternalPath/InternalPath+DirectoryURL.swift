import Foundation

extension InternalPath where K == Absolute, T == Directory {
    internal var directoryURL: URL {
        return URL(fileURLWithPath: directory.render(), isDirectory: true)
    }
}

extension InternalPath where K == Relative, T == Directory {
    internal var directoryURL: URL {
        return URL(fileURLWithPath: directory.render(), isDirectory: true)
    }
}

extension InternalPath where K == Relative, T == File {
    internal var directoryURL: URL {
        return URL(fileURLWithPath: directory.render(), isDirectory: true)
    }
}

extension InternalPath where K == Absolute, T == File {
    internal var directoryURL: URL {
        return URL(fileURLWithPath: directory.render(), isDirectory: true)
    }
}
