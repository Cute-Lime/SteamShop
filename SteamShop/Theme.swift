import SwiftUI
import UIKit

extension UIColor {
    convenience init(hex: UInt32) {
        self.init(red: CGFloat((hex >> 16) & 0xFF) / 255,
                  green: CGFloat((hex >> 8) & 0xFF) / 255,
                  blue: CGFloat(hex & 0xFF) / 255,
                  alpha: 1)
    }
}

extension Color {
    init(hex: UInt32) { self.init(UIColor(hex: hex)) }

    /// 依 Light / Dark Mode 自動切換顏色
    static func adaptive(light: UInt32, dark: UInt32) -> Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(hex: dark) : UIColor(hex: light) })
    }
}

/// 全 App 共用的色票
enum Theme {
    static let page          = Color.adaptive(light: 0xE6ECF4, dark: 0x101822)
    static let header        = Color.adaptive(light: 0xFFFFFF, dark: 0x1F2229)
    static let searchField   = Color.adaptive(light: 0xE3E6EB, dark: 0x2A2D37)
    static let panel         = Color.adaptive(light: 0xD3E0F0, dark: 0x1B2C47)
    static let panelCard     = Color.adaptive(light: 0xC2D3E8, dark: 0x243A5C)
    static let chip          = Color.adaptive(light: 0xB5C9E2, dark: 0x2F4A78)
    static let priceBox      = Color.adaptive(light: 0xBFD0E4, dark: 0x0F1722)
    static let textPrimary   = Color.adaptive(light: 0x1B2838, dark: 0xFFFFFF)
    static let textSecondary = Color.adaptive(light: 0x5A6B80, dark: 0xA8B4C4)
    static let accent        = Color(hex: 0x1A9FFF)
    static let discountGreen = Color(hex: 0xA4D007)
    static let discountDark  = Color(hex: 0x354B18)
    static let grayButton    = Color(hex: 0xD2D2D2)
    static let mixed         = Color(hex: 0xB9A074)
}
