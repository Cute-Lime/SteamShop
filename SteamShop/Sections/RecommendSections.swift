import SwiftUI

/// 通用的橫向捲動區塊
struct HorizontalGameSection: View {
    let title: String
    var subtitle: String? = nil
    let games: [Game]
    var buttons: [String] = []
    var buttonCaption: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: title, subtitle: subtitle)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(games) { game in CoverPriceCard(game: game) }
                }
                .padding(.horizontal, 8)
            }
            if !buttons.isEmpty {
                VStack(alignment: .trailing, spacing: 8) {
                    if let buttonCaption {
                        Text(buttonCaption)
                            .font(.system(size: 17))
                            .foregroundColor(Theme.textPrimary)
                            .padding(.trailing, 9)
                    }
                    HStack(spacing: 10) {
                        ForEach(buttons, id: \.self) { title in
                            GrayButton(title: title, fillWidth: false)
                        }
                    }
                    .padding(.trailing, 9)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

/// 瀏覽探索佇列
struct ExploreQueueBanner: View {
    var body: some View {
        ZStack(alignment: .leading) {
            LinearGradient(colors: [Color(hex: 0x5A3A7A), Color(hex: 0x3A5889), Color(hex: 0x1A7597), Color(hex: 0x2C4A78)],
                           startPoint: .bottomLeading, endPoint: .topTrailing)
            Image(.queue1)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .rotationEffect(.degrees(-12))
                .offset(x: -44, y: 60)
                .scaleEffect(1.8)
                .clipped()
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            
            Image(.queue2)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .center)
                .rotationEffect(.degrees(-12))
                .offset(x: 15, y: 48)
                .scaleEffect(1.8)
                .clipped()
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                .mask(
                    LinearGradient(
                        stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: .clear, location: 0.5),
                            .init(color: .black, location: 0.8),
                            .init(color: .black, location: 1.0)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("瀏覽您的探索佇列")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                Text("點擊就可開啟最暢銷、最新和推薦遊戲的佇列")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.85))
            }
            .padding(.leading, 12)
        }
        .frame(height: 150)
        .padding(.horizontal, 8)
    }
}

/// 2x2 網格
struct GridSection: View {
    let title: String
    var subtitle: String = "根據您玩的遊戲所推薦的標籤"
    let games: [Game]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: title, subtitle: subtitle)
            VStack(spacing: 14) {
                ForEach(0..<(games.count / 2), id: \.self) { row in
                    HStack(spacing: 14) {
                        GridGameCell(game: games[row * 2])
                            .frame(maxWidth: .infinity)
                        GridGameCell(game: games[row * 2 + 1])
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(8)
            .background(Theme.panel)
            .padding(.horizontal, 8)
            GrayButton(title: "查看更多")
        }
    }
}

#Preview("Dark") {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            HorizontalGameSection(title: "根據您遊玩的遊戲所推薦",
                                  games: SampleData.recommended,
                                  buttons: ["依標籤或其它條件自訂或探索"])

            HorizontalGameSection(title: "因為您曾玩過：Terraria",
                                  games: SampleData.because)

            ExploreQueueBanner()

            GridSection(title: "可愛", games: SampleData.cute)

            HorizontalGameSection(title: "低於 NT$ 300",
                                  games: SampleData.under300,
                                  buttons: ["低於 NT$ 300", "低於 NT$ 150"],
                                  buttonCaption: "查看更多：")
        }
    }
    .background(Theme.page)
    .preferredColorScheme(.dark)
}
