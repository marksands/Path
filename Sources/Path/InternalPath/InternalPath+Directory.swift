extension InternalPath where K == Absolute, T == File {
    internal var directory: InternalPath<Absolute, Directory> {
        switch self {
        case ._fileIn(let fp, _):
            return fp.directory
        case ._directoryIn:
            return coercedFileType(to: Directory.self)
        case ._root:
            return coercedFileType(to: Directory.self)
        case ._current:
            fatalError("Unhandled condition!")
        }
    }
}

extension InternalPath where K == Relative, T == File {
    internal var directory: InternalPath<Absolute, Directory> {
        switch self {
        case ._root:
            return ._root
        case ._directoryIn:
            return coercedPathKind(to: Absolute.self).coercedFileType(to: Directory.self)
        case ._fileIn(let fp, _):
            return fp.coercedPathKind(to: Absolute.self).coercedFileType(to: Directory.self)
        case ._current:
            fatalError("Unhandled condition!")
        }
    }
}

extension InternalPath where K == Absolute, T == Directory {
    internal var directory: InternalPath<Absolute, Directory> {
        return self
    }
}

extension InternalPath where K == Relative, T == Directory {
    internal var directory: InternalPath<Absolute, Directory> {
        fatalError("Lifting a relative directory path to an absolute path is currently unsupported")
    }
}
