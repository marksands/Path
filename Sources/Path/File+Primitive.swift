extension File {
    public static let root = Path(InternalPath<Absolute, Directory>._root)

    public static let current = Path(InternalPath<Relative, Directory>._current)

    public static func file(_ name: FileName) -> Path<Relative, File> {
        return Path(._fileIn(._current, name))
    }

    public static func directory(_ name: DirectoryName) -> Path<Relative, Directory> {
        return Path(._directoryIn(._current, name))
    }
}
