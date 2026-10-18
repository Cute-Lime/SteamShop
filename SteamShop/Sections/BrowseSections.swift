import SwiftUI

/// 熱門新品
struct NewReleasesSection: View {
    let tabs: [String]
    let games: [Game]
    var selectedTab: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 6) {
                    ForEach(tabs.indices, id: \.self) { i in
                        Text(tabs[i])
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(i == selectedTab ? Theme.textPrimary : Theme.textSecondary)
                            .padding(.horizontal, 10)
                            .frame(height: 48)
                            .background(i == selectedTab ? Theme.panel : Theme.panel.opacity(0.5))
                            .overlay(alignment: .bottom) {
                                Rectangle().fill(i == selectedTab ? Theme.accent : .clear).frame(height: 3)
                            }
                    }
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 20)
            }
            VStack(spacing: 12) {
                ForEach(games) { game in WideGameCard(game: game) }
            }
            .padding(.horizontal, 8)

            VStack(alignment: .trailing, spacing: 8) {
                Text("查看更多：")
                    .font(.system(size: 17))
                    .foregroundColor(Theme.textPrimary)
                    .padding(.trailing, 9)
                GrayButton(title: "熱門新品")
                Text("或")
                    .font(.system(size: 17))
                    .foregroundColor(Theme.textPrimary)
                    .padding(.trailing, 9)
                GrayButton(title: "所有新品")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

/// 依類別瀏覽
struct BrowseCategorySection: View {
    let categories: [Game]
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "依類別瀏覽")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 12) {
                    ForEach(categories) { cat in
                        ZStack {
                            CoverImage(name: cat.imageName, title: "", colors: cat.gradient, width: 185, height: 160)
                        }
                        .frame(width: 185, height: 160)
                        .cornerRadius(14)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

/// 來自您認識的開發者與發行商
struct DevelopersSection: View {
    let developers: [Developer]
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "來自您認識的開發者與發行商",
                              subtitle: "您關注的創作者或我們根據您玩的遊戲所推薦的創作者")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(developers) { dev in
                        VStack(spacing: 0) {
                            CoverImage(name: dev.game.imageName, title: dev.game.title,
                                       colors: dev.game.gradient, width: 250, height: 143)
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 10) {
                                    AssetOrSymbol(asset: dev.logoName, symbol: "building.2.fill")
                                        .foregroundColor(.white)
                                        .padding(0)
                                        .frame(width: 48, height: 48)
                                        .background(Color(hex: 0x15181E))
                                    Text(dev.name)
                                        .font(.system(size: 19, weight: .medium))
                                        .foregroundColor(Theme.textPrimary)
                                        .lineLimit(1)
                                }
                                Text("關注")
                                    .font(.system(size: 17))
                                    .foregroundColor(Theme.textPrimary)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .overlay(RoundedRectangle(cornerRadius: 2).stroke(Theme.accent.opacity(0.7), lineWidth: 1.5))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding(16)
                            .frame(width: 250, height: 116, alignment: .topLeading)
                            .background(Theme.panel)
                            HStack {
                                Spacer()
                                PriceTagView(discount: dev.game.discount, originalPrice: dev.game.originalPrice,
                                             price: dev.game.price)
                            }
                        }
                        .frame(width: 250)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

/// 社群推薦
struct CommunitySection: View {
    let reviews: [CommunityReview]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "社群推薦")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(reviews) { review in
                        CommunityReviewCard(review: review)
                    }
                }
                .padding(.horizontal, 8)
            }
            GrayButton(title: "依標籤或其它條件自訂或探索")
        }
    }
}

#Preview("Dark") {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            NewReleasesSection(tabs: SampleData.tabs, games: SampleData.newReleases)
            BrowseCategorySection(categories: SampleData.categories)
            DevelopersSection(developers: SampleData.developers)
            CommunitySection(reviews: SampleData.communityReviews)
        }
    }
    .background(Theme.page)
    .preferredColorScheme(.dark)
}
