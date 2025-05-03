//
//  AppComponentContainerView.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/28/24.
//

import SwiftUI

public struct AppComponentContainerView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var state: AppComponentState
    
    // MARK: - View
    
    public var body: some View {
        ZStack {
            if let customView = state.customView {
                customView
                    .transition(.opacity)
            }
        }
    }
}
