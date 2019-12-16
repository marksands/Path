extension Path {
    public func render(pathSeparator: String = "/") -> String {
        return self.internal.render()
    }
}
