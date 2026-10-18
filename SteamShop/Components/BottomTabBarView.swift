import SwiftUI

/// 底部 Tab
struct BottomTabBarView: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Theme.accent)
                .frame(width: 60, height: 3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .offset(x: 8)

            HStack {
                ZStack {
                    Image(systemName: "triangle.fill")
                        .foregroundColor(Theme.accent)
                        .scaleEffect(0.72)
                        .offset(x: 0, y: -12)
                    Image(systemName: "square.fill")
                        .foregroundColor(Theme.accent)
                        .scaleEffect(0.82)
                }
                .rotationEffect(.degrees(-45))
                Spacer()
                Image(systemName: "newspaper.fill")
                Spacer()
                Image(systemName: "shield.fill")
                Spacer()
                Image(systemName: "bell.fill")
                Spacer()
                Image(systemName: "line.3.horizontal")
            }
            .font(.system(size: 24))
            .foregroundColor(Theme.textPrimary)
            .padding(.horizontal, 36)
            .padding(.top, 14)
            .padding(.bottom, 8)
        }
        .background(Theme.header.ignoresSafeArea(edges: .bottom))
    }
}

#Preview {
    VStack {
        Spacer()
        BottomTabBarView()
    }
}
