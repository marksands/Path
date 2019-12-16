import Foundation

extension FileManager {
    public func removeFile(_ path: Path<Absolute, File>) throws {
        try removeItem(at: path.fileURL)
    }

    public func removeDirectory(_ path: Path<Absolute, Directory>) throws {
        try removeItem(at: path.directoryURL)
    }
}
