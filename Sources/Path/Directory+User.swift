import Foundation

extension Directory {
    public enum User {
        public static var caches: Path<Absolute, Directory> {
            guard let caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
                fatalError("Failed to locate cachesDirectory in userDomain!")
            }
                        
            return caches
                .components(separatedBy: "/")
                .filter { !$0.isEmpty }
                .reduce(Directory.root) { $0.joined(Directory.directory($1)) }
        }
        
        public static var applicationSupport: Path<Absolute, Directory> {
            guard let applicationSupport = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first else {
                fatalError("Failed to locate applicationSupportDirectory in userDomain!")
            }
            
            return applicationSupport
                .components(separatedBy: "/")
                .filter { !$0.isEmpty }
                .reduce(Directory.root) { $0.joined(Directory.directory($1)) }
        }
    }
    
    public static var temporary: Path<Absolute, Directory> {
        return NSTemporaryDirectory()
            .components(separatedBy: "/")
            .filter { !$0.isEmpty }
            .reduce(Directory.root) { $0.joined(Directory.directory($1)) }
    }
}
