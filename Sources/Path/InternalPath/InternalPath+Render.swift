extension InternalPath {
    internal func render(pathSeparator: String = "/") -> String {
        switch self {
        case ._root:
            return "/"
        case ._current:
            return "."
        case ._directoryIn(let fp, let d):
            return fp.render(pathSeparator: "/") + d.rawValue + pathSeparator
        case ._fileIn(let fp, let f):
            return fp.render(pathSeparator: "/") + f.rawValue
        }
    }
}
