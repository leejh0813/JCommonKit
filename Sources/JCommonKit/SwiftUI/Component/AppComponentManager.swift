//
//  AppComponentManager.swift
//  DailyInsights
//
//  Created by 이재홍 on 10/28/24.
//

import Foundation
import UIKit
import SwiftUI
import Lottie

final class PassThroughWindow: UIWindow {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let vc = self.rootViewController {
            vc.view.layoutSubviews() // otherwise the frame is as if the popup is still outside the screen
            if let _ = isTouchInsideSubview(point: point, vc: vc.view) {
                // pass tap to this UIPassthroughVC
                return vc.view
            }
        }
        return nil // pass to next window
    }
    
    private func isTouchInsideSubview(point: CGPoint, vc: UIView) -> UIView? {
        for subview in vc.subviews where subview.frame.contains(point) {
            return subview
        }
        return nil
    }
}

public final class AppComponentManager {
    
    // MARK: - Enum
    
    enum ComponentType: String {
        case toast
        case popup
        case loading
        case networkAlert
        
        var level: UIWindow.Level {
            switch self {
            case .toast: return .init(3000)
            case .popup: return .init(3500)
            case .loading: return .init(4000)
            case .networkAlert: return .init(4500)
            }
        }
    }
    
    // MARK: - Properties
    
    @MainActor public static let shared = AppComponentManager()
    
    private var windows: [String: UIWindow] = [:]
    private var toastWorkItem: DispatchWorkItem?
    private var states: [String: AppComponentState] = [
        ComponentType.toast.rawValue: AppComponentState(),
        ComponentType.popup.rawValue: AppComponentState(),
        ComponentType.loading.rawValue: AppComponentState()
    ]
    
    // MARK: - Initialization
    
    private init() { }
    
    // MARK: - Function
    
    @MainActor
    func showView<V: View>(_ view: V, type: ComponentType) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let state = states[type.rawValue] else { return }
        
        let overlayController = UIHostingController(
            rootView: AppComponentContainerView()
                .environmentObject(state)
                .environmentObject(FontManager())
        )
        overlayController.view.backgroundColor = .clear
        
        let window = PassThroughWindow(windowScene: windowScene)
        window.rootViewController = overlayController
        window.windowLevel = type.level
        window.makeKeyAndVisible()
        
        windows[type.rawValue]?.isHidden = true
        windows[type.rawValue] = nil
        
        windows[type.rawValue] = window
        
        state.showView(view)
    }
    
    @MainActor
    func hideView(type: ComponentType) {
        states[type.rawValue]?.hideView()
        
        windows[type.rawValue]?.isHidden = true
        windows[type.rawValue] = nil
    }
}

// MARK: - Loading

extension AppComponentManager {
    
    @MainActor
    public func showLoading(
        type: LoadingView.LottieAnimationType = .loading,
        loopMode: LottieLoopMode = .loop,
        speed: CGFloat = 1.0,
        animationDidFinish: (() -> Void)? = nil
    ) {
        showView(
            LoadingView(
                type: type,
                loopMode: loopMode,
                speed: speed,
                animationDidFinish: animationDidFinish
            ),
            type: .loading
        )
    }
    
    @MainActor
    public func hideLoading() {
        hideView(type: .loading)
    }
}

// MARK: - Toast

extension AppComponentManager {
    
    @MainActor
    public  func showToast(_ toast: Toast) {
        hideToast()
        
        showView(
            VStack {
                ToastView(style: toast.style, message: toast.message, confirmButtonAction: toast.confirmAction)
                    .padding(.horizontal, 72)
                
                Spacer()
            }.offset(y: 32),
            type: .toast
        )
        
        if toast.style == .text {
            toastWorkItem?.cancel()
            
            let workItem = DispatchWorkItem { [weak self] in
                self?.hideToast()
            }
            
            toastWorkItem = workItem
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: workItem)
        }
    }
    
    @MainActor
    public func hideToast() {
        toastWorkItem?.cancel()
        toastWorkItem = nil
        
        hideView(type: .toast)
    }
}

// MARK: - Popup

extension AppComponentManager {
    
    @MainActor
    public func showPopup<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) {
        showView(
            ZStack {
                Color.black.opacity(UI.dimOpacity)
                    .edgesIgnoringSafeArea(.all)
                
                content()
            },
            type: .popup
        )
    }
    
    @MainActor
    public func hidePopup() {
        hideView(type: .popup)
    }
}

// MARK: - Network

extension AppComponentManager {
    
    @MainActor
    public func showNetworkAlert<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) {
        showView(
            ZStack {
                content()
            },
            type: .networkAlert
        )
    }
    
    @MainActor
    public func hideNetworkAlert() {
        hideView(type: .networkAlert)
    }
}
