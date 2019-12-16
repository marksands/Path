extension InternalPath {
    internal func joined(_ other: InternalPath) -> InternalPath {
        switch (self, other) {
        case (._current, ._current):
            return ._current
        case (._root, ._current):
            return ._root
        case (._fileIn(let p1, let f1), ._current):
            return ._fileIn(p1.joined(._current), f1)
        case (._directoryIn(let p1, let d1), ._current):
            return ._directoryIn(p1.joined(._current), d1)
        case (let p1, ._fileIn(let p2, let f2)):
            return ._fileIn(p1.joined(p2), f2 )
        case (let p1, ._directoryIn(let p2, let d2)):
            return ._directoryIn(p1.joined(p2), d2)
        default:
            fatalError("Unhandled join scenario!")
        }
    }
}

extension InternalPath where T == Directory {
    internal func joined<T2>(_ other: InternalPath<Relative, T2>) -> InternalPath<K, T2> {
         switch (self, other) {
         case (._current, ._current):
             return ._current
         case (._root, ._current):
             return ._root
         case (._fileIn(let p1, let f1), ._current):
             return ._fileIn(p1.joined(._current), f1)
         case (._directoryIn(let p1, let d1), ._current):
             return ._directoryIn(p1.joined(._current), d1)
         case (let p1, ._fileIn(let p2, let f2)):
             return ._fileIn(p1.joined(p2), f2 )
         case (let p1, ._directoryIn(let p2, let d2)):
             return ._directoryIn(p1.joined(p2), d2)
         default:
             fatalError("Unhandled join scenario!")
         }
     }
}
