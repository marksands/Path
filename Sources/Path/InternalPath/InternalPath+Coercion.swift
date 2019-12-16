extension InternalPath {
    internal func coercedPathKind<K2>(to type: K2.Type) -> InternalPath<K2, T> {
        return unsafeBitCast(self, to: InternalPath<K2, T>.self)
    }

    internal func coercedFileType<T2>(to type: T2.Type) -> InternalPath<K, T2> {
        return unsafeBitCast(self, to: InternalPath<K, T2>.self)
    }
}
