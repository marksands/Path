extension Path {
    public func joined(_ other: Path<K, T>) -> Path<K, T> {
        let joined = self.internal.joined(other.internal)
        return Path(joined)
    }
}

extension Path where T == Directory {
    public func joined<T2>(_ other: Path<Relative, T2>) -> Path<K, T2> {
        let joined = self.internal.joined(other.internal)
        return Path<K, T2>(joined)
    }
}
