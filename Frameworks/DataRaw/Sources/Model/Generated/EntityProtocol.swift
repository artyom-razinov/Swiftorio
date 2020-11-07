public protocol EntityProtocol {
    var minable: Minable? { get }
    var selectionBox: Rect? { get }
    var collisionBox: Rect? { get }
    var weight: Float? { get }
    var fastReplaceableGroup: String? { get }
    var icon: FileName? { get }
}