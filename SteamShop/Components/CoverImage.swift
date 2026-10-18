import SwiftUI
import UIKit

/// 有 Asset 圖就用 Asset，否則以漸層 + 標題代替
struct CoverImage: View {
    let name: String
    var title: String = ""
    var colors: [Color] = [Color(hex: 0x2B4A7A), Color(hex: 0x0E1A2B)]
    var width: CGFloat? = nil
    let height: CGFloat

    var body: some View {
        Color.clear
            .frame(height: height)
            .frame(maxWidth: width ?? .infinity)
            .overlay(
                Group {
                    if UIImage(named: name) != nil {
                        Image(name)
                            .resizable()
                            .scaledToFill()
                    } else {
                        ZStack {
                            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                            Image(systemName: "gamecontroller.fill")
                                .font(.system(size: 44))
                                .foregroundColor(.white.opacity(0.12))
                            Text(title)
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 2)
                                .padding(10)
                        }
                    }
                }
            )
            .clipped()
    }
}

/// 有 Asset 圖就用 Asset，否則使用 SF Symbol
struct AssetOrSymbol: View {
    let asset: String
    let symbol: String
    var body: some View {
        if UIImage(named: asset) != nil {
            Image(asset).resizable().scaledToFit().padding(0)
        } else {
            Image(systemName: symbol).resizable().scaledToFit()
        }
    }
}
