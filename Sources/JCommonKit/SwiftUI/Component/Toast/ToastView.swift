//
//  ToastView.swift
//  DailyInsights
//
//  Created by 이재홍 on 7/14/24.
//

import SwiftUI

public struct ToastView: View {
    
    // MARK: - Properties
    
    private let style: ToastStyle
    private let message: String
    private let confirmButtonAction: (() -> Void)?
    
    @EnvironmentObject private var fontManager: FontManager
    
    // MARK: - Initialization
    
    public init(
        style: ToastStyle,
        message: String,
        confirmButtonAction: (
    () -> Void
        )? = nil
    ) {
        self.style = style
        self.message = message
        self.confirmButtonAction = confirmButtonAction
    }
    
    // MARK: - View
    
    public var body: some View {
        contentView
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(Color.gray20)
            .cornerRadius(12)
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch style {
        case .text:
            Text(message.forceCharWrapping)
                .customFont(color: Color.gray100, size: 16, weight: .medium)
                .lineLimit(2)
                .debugBackground()
            
        case .button:
            HStack(spacing: 20) {
                Text(message.forceCharWrapping)
                    .customFont(color: Color.gray100, size: 16, weight: .medium)
                    .lineLimit(2)
                    .debugBackground()
                    
                Button(action: {
                    confirmButtonAction?()
                }, label: {
                    Text(CommonUtils.isLocaleKo() ? "확인" : "Confirm")
                        .customFont(color: Color.secondary45, size: 16, weight: .bold)
                })
                .buttonStyle(.plain)
                .debugBackground()
            }
        }
    }
}
