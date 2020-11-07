public protocol PipeConnectableProtocol: EntityWithHealthProtocol {
    var minable: Minable? { get }
    var selectionBox: Rect? { get }
    var collisionBox: Rect? { get }
    var weight: Float? { get }
    var fastReplaceableGroup: String? { get }
    var icon: FileName? { get }
    var maxHealth: Float { get }
}