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
    
    private static let isDebugMode: Bool = {
        UserDefaults.standard.bool(forKey: debugModeView)
    }()
    
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
        if Self.isDebugMode {
            content
                .if(!disableBackground) { view in
                    view.background(Color.red.opacity(0.2), ignoresSafeAreaEdges: [])
                }
                .if(!disableBorder) { view in
                    view.border(Color.red, width: 0.5)
                }
        } else {
            content
        }
    }
}
