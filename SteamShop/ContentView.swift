import SwiftUI

/// 整頁 Steam 商店首頁
struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopBarView()

            ScrollView(showsIndicators: true) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 32) {
                        FeaturedSection(games: SampleData.featured)
                        DealsSection(items: SampleData.deals)
                        CalendarSection(days: SampleData.calendar)
                        HorizontalGameSection(title: "根據您遊玩的遊戲所推薦",
                                              games: SampleData.recommended,
                                              buttons: ["依標籤或其它條件自訂或探索"])
                        HorizontalGameSection(title: "因為您曾玩過：Cubic Castles",
                                             games: SampleData.because)
                        ExploreQueueBanner()
                        GridSection(title: "可愛", games: SampleData.cute)
                        GridSection(title: "運動 遊戲", subtitle: "精選標籤", games: SampleData.sports)
                        NewReleasesSection(tabs: SampleData.tabs, games: SampleData.newReleases)
                        BrowseCategorySection(categories: SampleData.categories)
                        DevelopersSection(developers: SampleData.developers)
                        CommunitySection(reviews: SampleData.communityReviews)
                        HorizontalGameSection(title: "低於 NT$ 300",
                                              games: SampleData.under300,
                                              buttons: ["低於 NT$ 300", "低於 NT$ 150"],
                                              buttonCaption: "查看更多：")
                    }
                    .padding(.top, 10)

                    FooterView()
                }
            }
            .background(Theme.page)

            BottomTabBarView()
        }
        .background(Theme.page.ignoresSafeArea())
    }
}

#Preview("Dark") {
    ContentView().preferredColorScheme(.dark)
}
