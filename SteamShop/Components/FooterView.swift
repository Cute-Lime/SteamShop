import SwiftUI

/// 頁尾
struct FooterView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(alignment: .top, spacing: 38) {
                VStack(alignment: .leading, spacing: 18) {
                    Text("STEAM").bold().foregroundColor(Theme.textPrimary).opacity(0.8)
                    Text("[關於 Steam](https://store.steampowered.com/about/)")
                    Text(
                        "[Steam 訂戶協議](https://store.steampowered.com/subscriber_agreement/)"
                    )
                    Text("[Steamworks](https://partner.steamgames.com/)")
                    Text("[Steam 發行](https://partner.steamgames.com/steamdirect)")
                    Text(
                        "[禮物卡](https://store.steampowered.com/digitalgiftcards/)"
                    )
                }
                VStack(alignment: .leading, spacing: 18) {
                    Text("VALVE").bold().foregroundColor(Theme.textPrimary).opacity(0.8)
                    Text("[關於 Valve](https://www.valvesoftware.com/)")
                    Text("[人才招募](https://www.valvesoftware.com/jobs)")
                    Text("[硬體](https://store.steampowered.com/steamdeck)")
                    Text("[回收](https://store.steampowered.com/)")
                }
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 30) {
                VStack(alignment: .leading, spacing: 18) {
                    Text("法務").bold().foregroundColor(Theme.textPrimary).opacity(0.8)
                    Text("[隱私](https://store.steampowered.com/privacy_agreement/)")
                    Text(
                        "[輔助功能](https://help.steampowered.com/faqs/view/10BB-D27A-6378-4436)"
                    )
                    Text("[公告與政策](https://store.steampowered.com/legal/)")
                    Text("[Cookie](https://store.steampowered.com/account/cookiepreferences/)")
                    Text(
                        "[退款](https://store.steampowered.com/steam_refunds/)"
                    )
                }
                Spacer()
                VStack(alignment: .leading, spacing: 18) {
                    Text("更多").bold().foregroundColor(Theme.textPrimary).opacity(0.8)
                    Text("[取得 Steam](https://store.steampowered.com/about/)")
                    Text("[取得行動應用程式](https://store.steampowered.com/mobile/)")
                    Text("[聯絡客服](https://help.steampowered.com/)")
                    Text("[我的帳戶](https://store.steampowered.com/account/)")
                }
                Spacer()
            }
            
            HStack(spacing: -10) {
                Image(.steamLogo)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 30)
                    .offset(x: -18)
                Image(.valveLogo)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 30)
            }

            Text("© 2026 Valve Corporation。版權所有。所有商標皆為其各自所有權人在美國與其他國家（地區）之財產。所有價格均包含增值稅（如適用）。")
                .font(.footnote)
                .frame(width: 310)

            HStack(spacing: 30) {
                Link(destination: URL(string: "https://www.youtube.com/@Steam")!) {
                    Image(systemName: "play.rectangle.fill")
                }
                Link(destination: URL(string: "https://bsky.app/profile/steampowered.com")!) {
                    Image(.blueskyIcon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Link(destination: URL(string: "https://www.facebook.com/Steam/")!) {
                    Image(.fbIcon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Link(destination: URL(string: "https://twitter.com/steam")!) {
                    Image(.xIcon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: -10)
                }
            }
            .font(.title)
        }
        .font(.system(size: 16))
        .foregroundColor(Theme.textSecondary)
        .tint(Theme.textSecondary)
        .padding(.horizontal, 40)
        .padding(.vertical, 30)
    }
}

#Preview {
    FooterView().background(Theme.page)
}
