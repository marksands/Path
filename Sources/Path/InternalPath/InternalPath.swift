internal indirect enum InternalPath<K: PathKind, T: FileType>: Hashable {
    case _root
    case _current
    case _directoryIn(InternalPath<K, T>, DirectoryName)
    case _fileIn(InternalPath<K, T>, FileName)
}
