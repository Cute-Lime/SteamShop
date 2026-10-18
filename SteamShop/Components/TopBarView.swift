import SwiftUI

/// 頂部 tab
struct TopBarView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 14) {
                HStack(spacing: 8) {
                    Image(.steamIcon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Theme.textSecondary)
                    Text("STEAM")
                        .font(.system(size: 17, weight: .heavy))
                        .tracking(2)
                        .foregroundColor(Theme.textSecondary)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundColor(Theme.textSecondary)
                }
                .padding(.horizontal, 8)
                .frame(height: 40)
                .background(Theme.searchField)

                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(Theme.textSecondary)

                ZStack {
                    Color.black
                    Image(systemName: "person.fill")
                        .foregroundColor(Theme.textSecondary)
                        .scaleEffect(1.9)
                }
                .frame(width: 40, height: 40)
            }
            .padding(.horizontal, 20)

            HStack(spacing: 28) {
                HStack(spacing: 6) {
                    Text("選單")
                    Image(systemName: "chevron.down")
                }
                Text("願望清單")
                Text("錢包")
            }
            .font(.system(size: 17, weight: .medium))
            .foregroundColor(Theme.textPrimary)
            .padding(.bottom, 10)
        }
        .padding(.top, 8)
        .frame(maxWidth: .infinity)
        .background(Theme.header.ignoresSafeArea(edges: .top))
    }
}

#Preview {
    VStack(spacing: 0) {
        TopBarView()
        Spacer()
    }
}
