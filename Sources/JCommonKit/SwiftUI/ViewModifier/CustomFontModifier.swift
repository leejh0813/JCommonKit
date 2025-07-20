//
//  CustomFontModifier.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct CustomFontModifier: ViewModifier {
    
    @EnvironmentObject private var fontManager: FontManager
    
    var fontFamily: FontManager.FontFamily?
    var color: Color?
    let size: CGFloat
    let weight: FontManager.FontWeight
    let lineHeight: CGFloat?
    
    private var resolvedFontFamily: FontManager.FontFamily {
        fontFamily ?? fontManager.fontFamily
    }
    
    private var fontName: String {
        FontManager.fontName(for: resolvedFontFamily, weight: weight)
    }
    
    private var customFont: Font {
        Font.custom(fontName, size: size)
    }
    
    private var uiFont: UIFont? {
        UIFont(name: fontName, size: size)
    }
    
    public func body(content: Content) -> some View {
        content
            .font(customFont)
            .modifier(OptionalForegroundColor(color: color))
            .ifLet(lineHeight) { view, lineHeight in
                view.fontWithLineHeight(
                    font: uiFont ?? UIFont.systemFont(ofSize: size),
                    lineHeight: lineHeight
                )
            }
    }
}
