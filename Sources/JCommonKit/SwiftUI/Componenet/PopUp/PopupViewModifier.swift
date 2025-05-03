//
//  PopupViewModifier.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/31/24.
//

import Foundation
import SwiftUI

struct PopupViewModifier<ContentView: View>: ViewModifier {
    
    // MARK: - Properties
    
    let isPresented: Bool
    let contentView: () -> ContentView
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { _, newValue in
                if newValue {
                    AppComponentManager.shared.showPopup(content: contentView)
                } else {
                    AppComponentManager.shared.hidePopup()
                }
            }
    }
}

// MARK: - View Extension

extension View {
    
    func showPopupView<ContentView: View>(
        isPresented: Bool,
        @ViewBuilder contentView: @escaping () -> ContentView
    ) -> some View {
        modifier(
            PopupViewModifier(
                isPresented: isPresented,
                contentView: contentView
            )
        )
    }
}
