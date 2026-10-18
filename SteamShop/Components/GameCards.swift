import SwiftUI

/// 精選與推薦：大張卡片(封面 + 標題 + 評價 + 價格)
struct FeaturedGameCard: View {
    let game: Game
    var width: CGFloat = 340

    var body: some View {
        VStack(spacing: 0) {
            CoverImage(name: game.imageName, title: game.title, colors: game.gradient, width: width, height: 195)
            VStack(alignment: .leading, spacing: 8) {
                Text(game.title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Theme.textPrimary)
                if let rating = game.reviewRating, let count = game.reviewCount {
                    Text("\(Text(rating).foregroundColor(game.reviewColor)) \(Text("(\(count))").foregroundColor(Theme.textPrimary))")
                        .font(.system(size: 15))
                }
                HStack {
                    Spacer()
                    PriceTagView(discount: game.discount, originalPrice: game.originalPrice, price: game.price, fontSize: 16)
                }
            }
            .padding(10)
            .frame(width: width, alignment: .leading)
            .background(
                LinearGradient(colors: [Theme.panelCard, Theme.panel], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        }
        .frame(width: width)
    }
}

/// 標準卡片(封面 + (標籤) + 價格）
struct CoverPriceCard: View {
    let game: Game
    var width: CGFloat = 250
    var coverHeight: CGFloat = 143

    var body: some View {
        VStack(spacing: 0) {
            CoverImage(name: game.imageName, title: game.title, colors: game.gradient,
                       width: width, height: coverHeight)
            if !game.tags.isEmpty {
                TagChipsView(rows: game.tags)
                    .padding(8)
                    .frame(width: width, alignment: .leading)
                    .background(
                        LinearGradient(colors: [Theme.panelCard, Theme.panel], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            }
            HStack {
                Spacer()
                PriceTagView(discount: game.discount, originalPrice: game.originalPrice, price: game.price)
            }
        }
        .frame(width: width)
    }
}

/// 精選標籤：小卡片 (封面 + 價格)
struct GridGameCell: View {
    let game: Game

    var body: some View {
        VStack(spacing: 0) {
            CoverImage(name: game.imageName, title: game.title, colors: game.gradient, height: 65)
            HStack {
                Spacer(minLength: 0)
                PriceTagView(discount: game.discount, originalPrice: game.originalPrice, price: game.price, fontSize: 11)
                    .offset(y: -3.5)
            }
            .frame(height: 32)
            .background(Theme.panel)
        }
        .clipped()
    }
}

/// 熱門新品：寬版卡片
struct WideGameCard: View {
    let game: Game

    var body: some View {
        VStack(spacing: 0) {
            CoverImage(name: game.imageName, title: game.title, colors: game.gradient, height: 142)
            HStack(alignment: .bottom, spacing: 8) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(game.title)
                        .font(.system(size: 16))
                        .foregroundColor(Theme.textPrimary)
                        .lineLimit(1)
                    Text(game.subtitle)
                        .font(.system(size: 11))
                        .foregroundColor(Theme.textSecondary)
                        .lineLimit(1)
                    Text(game.releaseDate)
                        .font(.system(size: 11))
                        .foregroundColor(Theme.textSecondary.opacity(0.8))
                }
                Spacer(minLength: 0)
                PriceTagView(discount: game.discount, originalPrice: game.originalPrice, price: game.price, fontSize: 10, stacked: true)
                        .frame(height: 20)
                        .padding(.bottom, 10)
            }
            .padding(10)
            .background(Theme.panel)
        }
    }
}

/// 單則社群評論卡片
struct CommunityReviewCard: View {
    let review: CommunityReview
    var width: CGFloat = 340

    var body: some View {
        VStack(spacing: 0) {
            CoverImage(name: review.game.imageName, title: review.game.title,
                       colors: review.game.gradient, width: width, height: 176)

            VStack(alignment: .leading, spacing: 10) {
                Text(review.game.title)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundColor(Theme.textPrimary)

                Text("\"\(review.text)")
                    .font(.system(size: 14))
                    .foregroundColor(Theme.textSecondary)
                    .lineLimit(4)

                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(Theme.textSecondary)
                        .frame(width: 38, height: 38)
                        .background(Color.black)
                    VStack(alignment: .leading, spacing: 3) {
                        Text(review.reviewerName)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Theme.accent)
                        Text("評論時已遊玩 \(String(format: "%.1f", review.playHours)) 小時")
                            .font(.system(size: 14))
                            .foregroundColor(Theme.textSecondary).opacity(0.5)
                        Text("\(review.helpfulCount) 個人認為這篇評論值得參考")
                            .font(.system(size: 14))
                            .foregroundColor(Theme.textSecondary).opacity(0.5)
                    }
                }

                HStack {
                    Spacer()
                    PriceTagView(discount: review.game.discount,
                                 originalPrice: review.game.originalPrice,
                                 price: review.game.price, fontSize: 16)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 18)
            .frame(width: width, alignment: .leading)
            .background(Theme.page.opacity(0.6))
        }
        .frame(width: width)
    }
}

#Preview("Dark") {
    ScrollView {
        VStack(spacing: 24) {
            FeaturedGameCard(game: SampleData.featured[0])

            CoverPriceCard(game: SampleData.recommended[0])
            
            CoverPriceCard(game: SampleData.because[0])

            GridGameCell(game: SampleData.cute[0])
                .frame(width: 180)

            WideGameCard(game: SampleData.newReleases[0])
            
            CommunitySection(reviews: SampleData.communityReviews)
        }
        .padding()
    }
    .background(Theme.page)
    .preferredColorScheme(.dark)
}
