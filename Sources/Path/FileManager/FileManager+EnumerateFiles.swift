import Foundation

extension FileManager {
    public func files(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, File>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: [.fileSizeKey, .totalFileSizeKey])
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, File>? in
            var fileURL = enumerator?.nextObject() as? URL
            
            while fileURL?.hasDirectoryPath ?? false {
                fileURL = enumerator?.nextObject() as? URL
            }
            
            if let fileURL = fileURL {
                return Path<Absolute, File>.file(from: fileURL.path)
            } else {
                return nil
            }
        })
    }
}
