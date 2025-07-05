//
//  RoundedRectangleCommonView.swift
//  JCommonKit
//
//  Created by 이재홍 on 7/5/25.
//

import SwiftUI

public struct RoundedRectangleCommonView<Content: View>: View {
    
    // MARK: - Properties
    
    private let cornerRadius: CGFloat
    private let backgroundColor: Color
    private let borderColor: Color?
    private let borderLineWidth: CGFloat?
    private let content: Content
    
    // MARK: - Initialization
    
    public init(
        cornerRadius: CGFloat,
        backgroundColor: Color,
        borderColor: Color? = nil,
        borderLineWidth: CGFloat? = nil,
        content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderLineWidth = borderLineWidth
        self.content = content()
    }
    
    // MARK: - View
    
    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor)
            .overlay {
                content
            }
            .overlay {
                if let borderColor, let borderLineWidth {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderLineWidth)
                }
            }
    }
}
