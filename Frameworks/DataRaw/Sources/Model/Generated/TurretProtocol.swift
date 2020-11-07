public protocol TurretProtocol: EntityWithHealthProtocol {
    var weight: Float? { get }
    var selectionBox: Rect? { get }
    var fastReplaceableGroup: String? { get }
    var minable: Minable? { get }
    var collisionBox: Rect? { get }
    var icon: FileName? { get }
    var maxHealth: Float { get }
}