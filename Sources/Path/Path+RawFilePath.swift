extension Path {
    internal static func file(from rawFilePath: String) -> Path<Absolute, File> {
        let pathComponents = rawFilePath.components(separatedBy: "/")
        
        guard let lastChunk = pathComponents.last else {
            fatalError("Invalid file path!")
        }
        
        return pathComponents
            .dropLast()
            .filter { !$0.isEmpty }
            .reduce(Directory.root) { $0.joined(Directory.directory($1)) }
            .joined(Directory.file(lastChunk))
    }
}
