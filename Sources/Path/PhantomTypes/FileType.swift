public protocol FileType: Hashable {}

public enum Directory: FileType {}
public enum File: FileType {}
