import Foundation

extension FileManager {
    public func createPath(_ path: Path<Absolute, Directory>) throws {
        try createDirectory(at: path.directoryURL, withIntermediateDirectories: true, attributes: nil)
    }

    public func createPath(_ path: Path<Relative, Directory>) throws {
        try createDirectory(at: path.directoryURL, withIntermediateDirectories: true, attributes: nil)
    }

    public func createPath(_ path: Path<Absolute, File>) throws {
        try createDirectory(at: path.directoryURL, withIntermediateDirectories: true, attributes: nil)
    }

    public func createPath(_ path: Path<Relative, File>) throws {
        try createDirectory(at: path.directoryURL, withIntermediateDirectories: true, attributes: nil)
    }
}
