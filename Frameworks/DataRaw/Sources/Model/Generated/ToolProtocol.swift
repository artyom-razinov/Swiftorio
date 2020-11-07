public protocol ToolProtocol: ItemProtocol {
    var icon: FileName? { get }
    var stackSize: Integer? { get }
    var icons: Icons? { get }
    var order: String? { get }
    var subgroup: ItemSubgroup? { get }
}