public final class ResearchAchievement: Codable, AchievementProtocol {
    public let icon: FileName
    public let order: String
    
    enum CodingKeys: String, CodingKey {
        case icon
        case order
    }
}