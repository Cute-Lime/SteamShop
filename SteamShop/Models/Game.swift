import SwiftUI

/// 遊戲卡片 Model
struct Game: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var subtitle: String = ""
    var tags: [[String]] = []
    var badge: String? = nil
    var reviewRating: String? = nil
    var reviewCount: String? = nil
    var reviewColor: Color = Theme.accent
    var releaseDate: String = ""
    var discount: Int? = nil
    var discountPrefix: String? = nil
    var originalPrice: String? = nil
    var price: String? = nil
    var gradient: [Color] = [Color(hex: 0x2B4A7A), Color(hex: 0x0E1A2B)]
}

struct CalendarDay: Identifiable {
    let id = UUID()
    let label: String
    let games: [Game]
}

struct Developer: Identifiable {
    let id = UUID()
    let name: String
    let logoName: String
    let game: Game
}

struct DealItem: Identifiable {
    let id = UUID()
    let games: [Game]
}

struct CommunityReview: Identifiable {
    let id = UUID()
    let game: Game
    let text: String
    let reviewerName: String
    let playHours: Double
    let helpfulCount: Int
}
