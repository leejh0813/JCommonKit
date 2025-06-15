//
//  UIDevice.swift
//  JCommonKit
//
//  Created by 이재홍 on 6/15/25.
//

import UIKit

public extension UIDevice {
    
    var modelIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0, value > 0 else { return identifier }
            return identifier + String(Character(UnicodeScalar(UInt8(value))))
        }
        return identifier
    }
    
    var modelName: String {
        let identifier = modelIdentifier
        
        switch identifier {
            // iPhone 12 시리즈
        case "iPhone13,1": return "iPhone 12 mini"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,4": return "iPhone 12 Pro Max"
            
            // iPhone 13 시리즈
        case "iPhone14,4": return "iPhone 13 mini"
        case "iPhone14,5": return "iPhone 13"
        case "iPhone14,2": return "iPhone 13 Pro"
        case "iPhone14,3": return "iPhone 13 Pro Max"
            
            // iPhone SE 3세대
        case "iPhone14,6": return "iPhone SE (3rd generation)"
            
            // iPhone 14 시리즈
        case "iPhone14,7": return "iPhone 14"
        case "iPhone14,8": return "iPhone 14 Plus"
        case "iPhone15,2": return "iPhone 14 Pro"
        case "iPhone15,3": return "iPhone 14 Pro Max"
            
            // iPhone 15 시리즈
        case "iPhone15,4": return "iPhone 15"
        case "iPhone15,5": return "iPhone 15 Plus"
        case "iPhone16,1": return "iPhone 15 Pro"
        case "iPhone16,2": return "iPhone 15 Pro Max"
            
            // iPhone 16 시리즈
        case "iPhone17,3": return "iPhone 16"
        case "iPhone17,4": return "iPhone 16 Plus"
        case "iPhone17,1": return "iPhone 16 Pro"
        case "iPhone17,2": return "iPhone 16 Pro Max"
            
            // iPad (iOS 17 지원 모델들)
        case "iPad13,1", "iPad13,2": return "iPad Air (5th generation)"
        case "iPad13,16", "iPad13,17": return "iPad Air (6th generation)"
        case "iPad14,3", "iPad14,4": return "iPad Pro 11-inch (4th generation)"
        case "iPad14,5", "iPad14,6": return "iPad Pro 12.9-inch (6th generation)"
        case "iPad13,18", "iPad13,19": return "iPad (10th generation)"
        case "iPad14,1", "iPad14,2": return "iPad mini (6th generation)"
            
            // 시뮬레터
        case "i386", "x86_64", "arm64": return "Simulator"
            
        default: return identifier
        }
    }
}
