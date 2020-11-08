public protocol IniParser {
    func parseIni(string: String) throws -> Ini
}
