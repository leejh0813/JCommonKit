//
//  test.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct FontWithLineHeightModifier: ViewModifier {
    
    // MARK: - Properties
    
    private let font: UIFont
    private let lineHeight: CGFloat
    
    // MARK: - Initialization
    
    public init(
        font: UIFont,
        lineHeight: CGFloat
    ) {
        self.font = font
        self.lineHeight = lineHeight
    }
    
    // MARK: - View
    
    public func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}
