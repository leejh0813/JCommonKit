//
//  LoadingViewModifier.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/28/24.
//

import Foundation
import SwiftUI
import Lottie

struct LoadingViewModifier: ViewModifier {
    
    // MARK: - Properties
    
    let type: LoadingView.LottieAnimationType
    let loopMode: LottieLoopMode
    let speed: CGFloat
    let animationDidFinish: (() -> Void)?
    @Binding var isPresented: Bool
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { _, newValue in
                if newValue {
                    AppComponentManager.shared.showLoading(
                        type: type,
                        loopMode: loopMode,
                        speed: speed,
                        animationDidFinish: animationDidFinish
                    )
                } else {
                    AppComponentManager.shared.hideLoading()
                }
            }
    }
}

// MARK: - View Extension

extension View {
    
    func showLoadingView(
        isPresented: Binding<Bool>,
        type: LoadingView.LottieAnimationType = .loading,
        loopMode: LottieLoopMode = .loop,
        speed: CGFloat = 1.0,
        animationDidFinish: (() -> Void)? = nil
    ) -> some View {
        modifier(
            LoadingViewModifier(
                type: type,
                loopMode: loopMode,
                speed: speed,
                animationDidFinish: animationDidFinish,
                isPresented: isPresented
            )
        )
    }
}
