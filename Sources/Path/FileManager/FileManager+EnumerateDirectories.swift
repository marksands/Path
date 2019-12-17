import Foundation

extension FileManager {
    public func directories(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, Directory>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: nil)
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, Directory>? in
            var directoryURL = enumerator?.nextObject() as? URL
            
            while !(directoryURL?.hasDirectoryPath ?? true) {
                directoryURL = enumerator?.nextObject() as? URL
            }
            
            if let directoryURL = directoryURL {
                return Path<Absolute, Directory>.directory(from: directoryURL.path)
            } else {
                return nil
            }
        })
    }
}
