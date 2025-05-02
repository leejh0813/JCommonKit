//
//  UIApplication+Extension.swift
//  DailyInsights
//
//  Created by 이재홍 on 2024/06/11.
//

import UIKit

public extension UIApplication {
    
    public var keyWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}
