import Foundation

extension FileManager {
    public func files(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, File>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: [.fileSizeKey, .totalFileSizeKey])
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, File>? in
            return enumerator?
                .first(where: { !(($0 as? URL)?.hasDirectoryPath ?? false) })
                .flatMap {
                    ($0 as? URL).map { .file(from: $0.path) }
                }
        })
    }
}
