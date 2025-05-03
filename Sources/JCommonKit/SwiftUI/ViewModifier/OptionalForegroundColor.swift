//
//  OptionalForegroundColor.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct OptionalForegroundColor: ViewModifier {
    
    // MARK: - Properties
    
    private let color: Color?
    
    // MARK: - Initialization
    
    public init(
        color: Color?
    ) {
        self.color = color
    }
    
    // MARK: - View
    
    public func body(content: Content) -> some View {
        if let color = color {
            content.foregroundStyle(color)
        } else {
            content
        }
    }
}
