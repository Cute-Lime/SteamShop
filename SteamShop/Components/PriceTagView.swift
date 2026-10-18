import SwiftUI

/// 價格區塊
struct PriceTagView: View {
    var discount: Int? = nil
    var discountPrefix: String? = nil
    var originalPrice: String? = nil
    var price: String? = nil
    var fontSize: CGFloat = 15
    var stacked: Bool = false        // true: 上下排, false: 左右排
    var darkBadge: Bool = false      // true: 深綠底亮綠字, false:淺綠底黑字
    private var height: CGFloat { stacked ? 40 : 25 }
    var originalScale: CGFloat = 1.0
    var bgOpacity: CGFloat = 0.5
    
    var body: some View {
        HStack(spacing: 0) {
            if let discount {
                Text("\(discountPrefix ?? "") -\(discount)%")
                    .font(.system(size: stacked ? fontSize * 1.3 : fontSize, weight: .bold))
                    .foregroundColor(darkBadge ? Theme.discountGreen : Color(hex: 0x1B2300))
                    .padding(.horizontal, 6)
                    .frame(height: height)
                    .background(darkBadge ? Theme.discountDark : Theme.discountGreen)
            }
            if price != nil {
                Group {
                    if stacked {
                        VStack(alignment: .trailing, spacing: 2) {
                            if let originalPrice { strikeText(originalPrice) }
                            if let price { Text(price).font(.system(size: fontSize)).foregroundColor(Theme.textPrimary) }
                        }
                    } else {
                        HStack(spacing: 5) {
                            if let originalPrice { strikeText(originalPrice) }
                            if let price { Text(price).font(.system(size: fontSize)).foregroundColor(Theme.textPrimary) }
                        }
                    }
                }
                .padding(.horizontal, 8)
                .frame(height: height)
                .background(Theme.priceBox.opacity(bgOpacity))
            }
        }
        .fixedSize()
        .frame(height: height)
    }

    private func strikeText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: fontSize * originalScale))
            .strikethrough()
            .foregroundColor(Theme.textSecondary)
    }
}

#Preview("Dark") {
    VStack(spacing: 16) {
        PriceTagView(price: "NT$ 400")
        PriceTagView(discount: 25, originalPrice: "NT$ 249", price: "NT$ 186")
        PriceTagView(discount: 40, discountPrefix: "最高可省",stacked: true , darkBadge: true)
        PriceTagView(discount: 50, originalPrice: "NT$ 1,290", price: "NT$ 645",
                     fontSize: 18, stacked: true, darkBadge: true, originalScale: 0.7)
    }
    .padding()
    .background(Theme.page)
    .preferredColorScheme(.dark)
}
