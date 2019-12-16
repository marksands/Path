infix operator <%>: TernaryPrecedence
public func <%><K>(_ lhs: Path<K, Directory>, _ rhs: Path<Relative, Directory>) -> Path<K, Directory> {
    let joined = lhs.internal.joined(rhs.internal)
    return Path(joined)
}

public func <%><K>(_ lhs: Path<K, Directory>, _ rhs: Path<Relative, File>) -> Path<K, File> {
    let joined = lhs.internal.joined(rhs.internal)
    return Path(joined)
}
