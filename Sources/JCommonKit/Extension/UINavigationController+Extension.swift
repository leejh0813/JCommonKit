//
//  UINavigationController+Extension.swift
//  DailyInsights
//
//  Created by 이재홍 on 2024/05/22.
//

import UIKit

/// https://stackoverflow.com/questions/59921239/hide-navigation-bar-without-losing-swipe-back-gesture-in-swiftui
/// .toolbar(.hidden) 을 하면 Swipe back 동작 안함, 아래 코드로 인해 정상 동작
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
