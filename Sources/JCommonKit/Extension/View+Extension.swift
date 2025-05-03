//
//  View+Extension.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func ifLet<T, Content: View>(_ optional: T?, transform: (Self, T) -> Content) -> some View {
        if let value = optional {
            transform(self, value)
        } else {
            self
        }
    }
    
    func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeightModifier(font: font, lineHeight: lineHeight))
    }
    
    func customFont(fontFamily: FontManager.FontFamily? = nil, size: CGFloat, weight: FontManager.FontWeight) -> some View {
        self.modifier(CustomFontModifier(fontFamily: fontFamily, size: size, weight: weight, lineHeight: nil))
    }
    
    func customFont(fontFamily: FontManager.FontFamily? = nil, color: Color?, size: CGFloat, weight: FontManager.FontWeight) -> some View {
        self.modifier(CustomFontModifier(fontFamily: fontFamily, color: color, size: size, weight: weight, lineHeight: nil))
    }
    
    func customFont(fontFamily: FontManager.FontFamily? = nil, color: Color?, size: CGFloat, weight: FontManager.FontWeight, lineHeight: CGFloat) -> some View {
        self.modifier(CustomFontModifier(fontFamily: fontFamily, color: color, size: size, weight: weight, lineHeight: lineHeight))
    }
    
    func debugBackground(disableBackground: Bool = false, disableBorder: Bool = false) -> some View {
        self.modifier(DebugBackground(disableBackground: disableBackground, disableBorder: disableBorder))
    }
}
