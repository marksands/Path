import XCTest
import Path

final class PathTests: XCTestCase {
    func testRendering() {
        XCTAssertEqual(File.root.render(), "/")
        XCTAssertEqual(File.current.render(), ".")
        XCTAssertEqual((File.root <%> File.directory("var")).render(), "/var/")
        XCTAssertEqual((File.root <%> File.file("tmp.txt")).render(), "/tmp.txt")
        XCTAssertEqual((File.root <%> File.directory("var") <%> File.file("tmp.txt")).render(), "/var/tmp.txt")
    }
    
    func testDirectoryURL() {
        XCTAssertEqual(File.root.directoryURL, URL(fileURLWithPath: "/"))
        XCTAssertEqual((File.root <%> File.directory("var")).directoryURL, URL(fileURLWithPath: "/var/"))
        XCTAssertEqual((File.root <%> File.file("tmp.txt")).directoryURL, URL(fileURLWithPath: "/"))
        XCTAssertEqual((File.root <%> File.directory("var") <%> File.file("tmp.txt")).directoryURL, URL(fileURLWithPath: "/var/"))
    }
    
    func testFileURL() {
        XCTAssertEqual((File.root <%> File.file("tmp.txt")).fileURL, URL(fileURLWithPath: "/tmp.txt"))
        XCTAssertEqual((File.root <%> File.directory("var") <%> File.file("tmp.txt")).fileURL, URL(fileURLWithPath: "/var/tmp.txt"))
    }
    
    func testFileUtil() {
        XCTAssertTrue(File.Util.temporary.render().hasSuffix("/tmp/"))
        XCTAssertTrue(File.Util.applicationSupport.render().hasSuffix("/Application Support/"))
        XCTAssertTrue(File.Util.userCache.render().hasSuffix("/Library/Caches/"))
    }
    
    func testFileEnumeration() {
        let data = "hello, world".data(using: .utf8)!
        
        try? data.write(to: (File.Util.temporary <%> File.file("fish.txt")).fileURL)
        try? data.write(to: (File.Util.temporary <%> File.file("fish1.txt")).fileURL)
        try? data.write(to: (File.Util.temporary <%> File.file("fish2.txt")).fileURL)
        
        FileManager.default.files(in: File.Util.temporary).forEach { filePath in
            print(filePath.render())
        }
    }
    
    func testDirectoryEnumeration() {
        FileManager.default.directories(in: File.Util.temporary).forEach { directoryPath in
            print(directoryPath.render())
        }
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
