import SwiftUI

/// 標題區塊
struct SectionHeaderView: View {
    let title: String
    var subtitle: String? = nil
    var badge: String? = nil

    var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 10) {
                    if let badge {
                        Text(badge)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 5)
                            .background(Theme.accent)
                            .cornerRadius(5)
                    }
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Theme.textPrimary)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(Theme.textSecondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
        }
}

/// 灰色按鈕
struct GrayButton: View {
    let title: String
    var fillWidth: Bool = true

    var body: some View {
        Text(title)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Theme.grayButton)
            .cornerRadius(4)
            .frame(maxWidth: fillWidth ? .infinity : nil, alignment: .trailing)
            .padding(.trailing, fillWidth ? 9 : 0)
    }
}

/// 小標籤
struct TagChipsView: View {
    let rows: [[String]]
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(rows.indices, id: \.self) { i in
                HStack(spacing: 6) {
                    ForEach(rows[i], id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 12.3))
                            .foregroundColor(Theme.textPrimary)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .background(Theme.chip)
                            .cornerRadius(2)
                    }
                }
            }
        }
    }
}

#Preview("Dark") {
    ContentView().preferredColorScheme(.dark)
}
