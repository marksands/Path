import Foundation

extension FileManager {
    public func files(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, File>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: nil)
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, File>? in
            var fileURL = enumerator?.nextObject() as? URL
            
            while fileURL?.hasDirectoryPath ?? false {
                fileURL = enumerator?.nextObject() as? URL
            }
            
            if let fileURL = fileURL {
                let pathComponents = fileURL.path.components(separatedBy: "/")
                guard let lastChunk = pathComponents.last else { return nil }
                    
                let directory = pathComponents
                    .dropLast()
                    .filter { !$0.isEmpty }
                    .reduce(File.root) { $0.joined(File.directory(DirectoryName(rawValue: $1))) }
                    .internal
                    
                return Path<Absolute, File>(._fileIn(directory.coercedFileType(to: File.self), FileName(rawValue: lastChunk)))
            } else {
                return nil
            }
        })
    }
    
    public func directories(in path: Path<Absolute, Directory>) -> AnySequence<Path<Absolute, Directory>> {
        let enumerator = self.enumerator(at: path.directoryURL, includingPropertiesForKeys: nil)
        
        return AnySequence(sequence(state: enumerator) { enumerator -> Path<Absolute, Directory>? in
            var directoryURL = enumerator?.nextObject() as? URL
            
            while !(directoryURL?.hasDirectoryPath ?? false) {
                directoryURL = enumerator?.nextObject() as? URL
            }
            
            if let directoryURL = directoryURL {
                return directoryURL.path
                    .components(separatedBy: "/")
                    .filter { !$0.isEmpty }
                    .reduce(File.root) { $0.joined(File.directory(DirectoryName(rawValue: $1))) }
            } else {
                return nil
            }
        })
    }
}
