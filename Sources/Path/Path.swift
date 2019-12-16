public struct Path<K: PathKind, T: FileType>: Hashable, Equatable {
    internal let `internal`: InternalPath<K, T>
    
    internal init(_ path: InternalPath<K, T>) {
        self.internal = path
    }
}
