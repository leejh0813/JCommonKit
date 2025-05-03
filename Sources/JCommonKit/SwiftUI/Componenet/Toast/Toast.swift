//
//  Toast.swift
//  DailyInsights
//
//  Created by 이재홍 on 11/3/24.
//

import Foundation

public enum ToastStyle {
    case text
    case button
}

public struct Toast: Equatable, Identifiable {
    public var id = UUID()
    var style: ToastStyle = .text
    var message: String
    var duration: Double = 0.3
    var width: Double = .infinity
    var confirmAction: (() -> Void)?
    
    public init(
        id: UUID = UUID(),
        style: ToastStyle,
        message: String,
        duration: Double,
        width: Double,
        confirmAction: (() -> Void)? = nil
    ) {
        self.id = id
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
        self.confirmAction = confirmAction
    }
    
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.id == rhs.id
    }
}
