import Foundation

extension FileManager {
    @available(OSX 10.11, *)
    public func directories(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, Directory>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: nil)
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, Directory>? in
            return enumerator?
                .first(where: { ($0 as? URL)?.hasDirectoryPath ?? false })
                .flatMap {
                    ($0 as? URL).map { .directory(from: $0.path) }
                }
        })
    }
}
