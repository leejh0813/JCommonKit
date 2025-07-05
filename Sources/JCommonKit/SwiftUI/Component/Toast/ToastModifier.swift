//
//  ToastModifier.swift
//  DailyInsights
//
//  Created by 이재홍 on 7/14/24.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    
    @Binding var toast: Toast?
    
    func body(content: Content) -> some View {
        content
            .onChange(of: toast) { _, newToast in
                if let newToast = newToast {
                    AppComponentManager.shared.showToast(newToast)
                }
            }
    }
}
