import SwiftUI

/// 精選與推薦
struct FeaturedSection: View {
    let games: [Game]
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "精選與推薦")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(games) { game in FeaturedGameCard(game: game) }
                }
                .padding(.horizontal, 18)
            }
        }
    }
}

/// 圖片左上角的漸層標籤
struct BadgeLabel: View {
    let text: String
    let colors: [Color]

    var body: some View {
        Text(text)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            )
    }
}

/// 個人化遊戲列表：1 款遊戲 → 大卡；2 款遊戲 → 上下兩張小卡
struct DealTile: View {
    let item: DealItem
    private var isDouble: Bool { item.games.count > 1 }

    var body: some View {
        VStack(spacing: 8) {
            ForEach(item.games) { game in
                VStack(alignment: .trailing, spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        CoverImage(name: game.imageName, title: game.title, colors: game.gradient, width: 225, height: isDouble ? 102 : 252)
                        if let badge = game.badge {
                            BadgeLabel(
                                text: badge,
                                colors: isDouble ? [Theme.panelCard, Theme.accent]
                                                 : [Color(hex: 0x3F1236), Color(hex: 0x7A2A57)]
                            )
                        }
                    }
                    PriceTagView(discount: game.discount, discountPrefix: game.discountPrefix,
                                 originalPrice: game.originalPrice, price: game.price,
                                 fontSize: 20, stacked: true, darkBadge: true, originalScale: 0.7)
                }
            }
        }
        .frame(width: 225)
    }
}

/// 折扣與活動 + 送禮物卡
struct DealsSection: View {
    let items: [DealItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "折扣與活動")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(items) { item in
                        DealTile(item: item)
                    }
                }
                .padding(18)
            }
            .background(
                LinearGradient(colors: [Theme.panelCard, Theme.panel], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .padding(.horizontal, 8)

            GrayButton(title: "查看更多")
                .offset(x: 0, y: -17)

            GiftCardBanner()
        }
    }
}

/// 禮物卡橫幅
struct GiftCardBanner: View {
    var body: some View {
        ZStack(alignment: .leading) {
            LinearGradient(colors: [Color(hex: 0x1B2C47), Theme.accent], startPoint: .leading, endPoint: .trailing)
            Image(.steamGiftcard)
                .resizable()
                .scaledToFit()
                .frame(height: 42)
                .padding(.leading, 8)
            Text("寄送禮物卡")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
                .padding(.leading, 85)
        }
        .frame(height: 5)
        .padding(.horizontal, 10)
    }
}

/// 您的個人行事曆
struct CalendarSection: View {
    let days: [CalendarDay]
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeaderView(title: "您的個人行事曆", subtitle: "個人化的新遊戲和即將推出遊戲列表", badge: "新")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(days) { day in
                        let isToday = (day.id == days.first?.id)

                        VStack(spacing: 12) {
                            Text(isToday ? "今天" : day.label)
                                .font(.system(size: 17, weight: .semibold))
                                .underline(isToday)
                                .foregroundColor(isToday ? .white : Theme.textSecondary)
                                .frame(maxWidth: .infinity, alignment: .center)

                            ForEach(day.games) { game in
                                CoverImage(name: game.imageName, title: game.title, colors: game.gradient, width: 84, height: 125)
                            }
                        }
                        .padding(.vertical, 12)
                        .frame(width: 100)
                        .background(
                            LinearGradient(
                                colors: isToday ? [Color(hex: 0x243A5C), Color(hex: 0x7A2A57)]
                                                : [Color(hex: 0x3F1236), Color(hex: 0x7A2A57)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    }
                }
                .padding(.horizontal, 8)
            }
            GrayButton(title: "探索更多")
        }
    }
}

#Preview {
    ScrollView(showsIndicators: true) {
        VStack(alignment: .leading, spacing: 32) {
            FeaturedSection(games: SampleData.featured)
            DealsSection(items: SampleData.deals)
            CalendarSection(days: SampleData.calendar)
        }
    }
    .background(Theme.page)
    .preferredColorScheme(.dark)
}
