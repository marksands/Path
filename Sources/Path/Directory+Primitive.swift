extension Directory {
    public static let root = Path(InternalPath<Absolute, Directory>._root)

    public static let current = Path(InternalPath<Relative, Directory>._current)

    public static func file(_ name: String) -> Path<Relative, File> {
        return Path(._fileIn(._current, FileName(name)))
    }

    public static func directory(_ name: String) -> Path<Relative, Directory> {
        return Path(._directoryIn(._current, DirectoryName(name)))
    }
}
