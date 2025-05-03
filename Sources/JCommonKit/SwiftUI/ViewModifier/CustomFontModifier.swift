//
//  CustomFontModifier.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct CustomFontModifier: ViewModifier {
    
    // MARK: - Properties
    
    @EnvironmentObject private var fontManager: FontManager
    
    var fontFamily: FontManager.FontFamily?
    var color: Color?
    let size: CGFloat
    let weight: FontManager.FontWeight
    let lineHeight: CGFloat?
    
    public init(
        fontFamily: FontManager.FontFamily? = nil,
        color: Color? = nil,
        size: CGFloat,
        weight: FontManager.FontWeight,
        lineHeight: CGFloat?
    ) {
        self.fontFamily = fontFamily
        self.color = color
        self.size = size
        self.weight = weight
        self.lineHeight = lineHeight
    }
    
    // MARK: - Function

    public func body(content: Content) -> some View {
        content
            .font(
                Font.custom(
                    FontManager.fontName(
                        for: fontFamily ?? fontManager.fontFamily,
                        weight: weight
                    ),
                    size: size
                )
            )
            .modifier(OptionalForegroundColor(color: color))
            .ifLet(lineHeight) { view, lineHeight  in
                view.fontWithLineHeight(
                    font: UIFont(
                        name: FontManager.fontName(for: fontManager.fontFamily, weight: weight),
                        size: size
                    )!,
                    lineHeight: lineHeight
                )
            }
    }
}
