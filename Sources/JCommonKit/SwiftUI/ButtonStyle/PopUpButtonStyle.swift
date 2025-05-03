//
//  Untitled.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

// MARK: - PopUpButtonStyle

public struct PopUpButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(configuration.isPressed ? Color.gray97 : Color.gray100)
            //.cornerRadius(8, corners: [.allCorners])
            //.debugBackground()
    }
}
