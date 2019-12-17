extension Path {
    internal static func directory(from rawDirectoryPath: String) -> Path<Absolute, Directory> {
        return rawDirectoryPath
            .components(separatedBy: "/")
            .filter { !$0.isEmpty }
            .reduce(Directory.root) { $0.joined(Directory.directory(DirectoryName(rawValue: $1))) }
    }
}
