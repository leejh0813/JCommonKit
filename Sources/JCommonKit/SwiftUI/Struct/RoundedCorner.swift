//
//  Untitled.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct RoundedCorner: Shape {
    
    // MARK: - Properties
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    // MARK: - Function
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
