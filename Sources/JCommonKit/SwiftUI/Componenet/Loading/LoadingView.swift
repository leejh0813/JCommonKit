//
//  LoadingView.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/28/24.
//

import SwiftUI
import Lottie

public struct LoadingView: View {
    
    // MARK: - Enum
    
    public enum LottieAnimationType: String {
        case loading
        
        var filename: String {
            switch self {
            case .loading:
                "loading"
            }
        }
    }
    
    // MARK: - Properties
    
    private let type: LottieAnimationType
    private let loopMode: LottieLoopMode
    private let speed: CGFloat
    private let animationDidFinish: (() -> Void)?
    
    // MARK: - Initialization
    
    public init(
        type: LottieAnimationType,
        loopMode: LottieLoopMode = .loop,
        speed: CGFloat = 1.0,
        animationDidFinish: (() -> Void)? = nil
    ) {
        self.type = type
        self.loopMode = loopMode
        self.speed = speed
        self.animationDidFinish = animationDidFinish
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(UI.dimOpacity)
                .edgesIgnoringSafeArea(.all)
            
            LottieView(animation: .named(type.filename, bundle: .module))
                .playing(loopMode: loopMode)
                .animationDidFinish { completed in
                    if completed {
                        animationDidFinish?()
                    }
                }
                .frame(width: 50, height: 50)
        }
    }
}
