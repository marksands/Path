import XCTest
import Path

final class PathTests: XCTestCase {
    func testRendering() {
        XCTAssertEqual(Directory.root.render(), "/")
        XCTAssertEqual(Directory.current.render(), ".")
        XCTAssertEqual((Directory.root <%> Directory.directory("var")).render(), "/var/")
        XCTAssertEqual((Directory.root <%> Directory.file("tmp.txt")).render(), "/tmp.txt")
        XCTAssertEqual((Directory.root <%> Directory.directory("var") <%> Directory.file("tmp.txt")).render(), "/var/tmp.txt")
    }
    
    func testDirectoryURL() {
        XCTAssertEqual(Directory.root.directoryURL, URL(fileURLWithPath: "/"))
        XCTAssertEqual((Directory.root <%> Directory.directory("var")).directoryURL, URL(fileURLWithPath: "/var/"))
        XCTAssertEqual((Directory.root <%> Directory.file("tmp.txt")).directoryURL, URL(fileURLWithPath: "/"))
        XCTAssertEqual((Directory.root <%> Directory.directory("var") <%> Directory.file("tmp.txt")).directoryURL, URL(fileURLWithPath: "/var/"))
    }
    
    func testFileURL() {
        XCTAssertEqual((Directory.root <%> Directory.file("tmp.txt")).fileURL, URL(fileURLWithPath: "/tmp.txt"))
        XCTAssertEqual((Directory.root <%> Directory.directory("var") <%> Directory.file("tmp.txt")).fileURL, URL(fileURLWithPath: "/var/tmp.txt"))
    }
    
    func testFileUtil() {
        XCTAssertTrue(Directory.temporary.render().hasSuffix("/tmp/"))
        XCTAssertTrue(Directory.User.applicationSupport.render().hasSuffix("/Application Support/"))
        XCTAssertTrue(Directory.User.caches.render().hasSuffix("/Library/Caches/"))
    }
    
    func testFileEnumeration() throws {
        let data = "hello, world".data(using: .utf8)!
        
        let f1 = Directory.temporary <%> Directory.file("fish.txt")
        let f2 = Directory.temporary <%> Directory.file("fish1.txt")
        let f3 = Directory.temporary <%> Directory.file("fish2.txt")
        
        try data.write(to: f1.fileURL)
        try data.write(to: f2.fileURL)
        try data.write(to: f3.fileURL)
        
        FileManager.default.files(in: Directory.temporary).forEach { filePath in
            XCTAssertTrue(!filePath.fileURL.hasDirectoryPath)
        }

        XCTAssertTrue(!Array(FileManager.default.files(in: Directory.temporary)).isEmpty)
        
        try FileManager.default.removeFile(f1)
        try FileManager.default.removeFile(f2)
        try FileManager.default.removeFile(f3)
    }
    
    func testDirectoryEnumeration() throws {
        let p1 = Directory.temporary <%> Directory.directory("nested") <%> Directory.directory("directory")
        
        try FileManager.default.createPath(p1)
        
        FileManager.default.directories(in: Directory.temporary).forEach { directoryPath in
            XCTAssertTrue(directoryPath.directoryURL.hasDirectoryPath)
        }
        
        XCTAssertTrue(!Array(FileManager.default.files(in: Directory.temporary)).isEmpty)
        
        try FileManager.default.removeDirectory(p1)
    }
    
    static var allTests = [
        ("testRendering", testRendering),
        ("testDirectoryURL", testDirectoryURL),
        ("testFileURL", testFileURL),
        ("testFileUtil", testFileUtil),
        ("testFileEnumeration", testFileEnumeration),
        ("testDirectoryEnumeration", testDirectoryEnumeration)
    ]
}
