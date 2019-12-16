public protocol PathKind: Hashable {}

public enum Absolute: PathKind {}
public enum Relative: PathKind {}
