//
//  test1.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct DebugBackground: ViewModifier {
    
    // MARK: - Properties
    
    static let debugModeView = "debugModeView"
    
    @AppStorage(debugModeView) private var debugModeViewStorage: Bool = false
    
    private let disableBackground: Bool
    private let disableBorder: Bool
    
    // MARK: - Initialization
    
    init(
        disableBackground: Bool,
        disableBorder: Bool
    ) {
        self.disableBackground = disableBackground
        self.disableBorder = disableBorder
    }
    
    // MARK: - Function
    
    public func body(content: Content) -> some View {
        content
            .if(!disableBackground) { view in
                view.background(debugModeViewStorage ? Color.red.opacity(0.2) : Color.clear, ignoresSafeAreaEdges: [])
            }
            .if(!disableBorder) { view in
                view.border(debugModeViewStorage ? Color.red : Color.clear, width: 0.5)
            }
    }
}
