//
//  AppComponentState.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/28/24.
//

import SwiftUI

public final class AppComponentState: ObservableObject {
    
    // MARK: - Properties
    
    @Published var customView: AnyView?
    
    // MARK: - Function
    
    func showView<V: View>(_ view: V) {
        customView = AnyView(view)
    }
    
    func hideView() {
        customView = nil
    }
}
