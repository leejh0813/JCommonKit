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
    
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.id == rhs.id
    }
}
